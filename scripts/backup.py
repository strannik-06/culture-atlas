#!/usr/bin/env python3
"""Encrypted R2 backup. Offline verification/extraction never writes to Supabase."""
import argparse
import base64
from datetime import datetime, timezone
import gzip
import hashlib
import json
import os
from pathlib import Path
import secrets
import sys
import urllib.request
from cryptography.hazmat.primitives.ciphers.aead import AESGCM

MAGIC = b'CULTURE-ATLAS-BACKUP-v1\n'
TABLES = ('film_progress','tv_progress','book_progress','books','media_catalogue','media_provider_links')
ROOT = Path(__file__).resolve().parent.parent

def key():
    try:
        result=base64.b64decode(os.environ['BACKUP_ENCRYPTION_KEY'],validate=True)
        if len(result)!=32: raise ValueError()
        return result
    except (KeyError,ValueError):
        raise ValueError('BACKUP_ENCRYPTION_KEY must contain a base64-encoded 32-byte key.') from None

def canonical(value):
    return json.dumps(value,ensure_ascii=False,sort_keys=True,separators=(',',':')).encode()

def digest(value):
    return hashlib.sha256(value).hexdigest()

def pack(snapshot, files, encryption_key):
    if not all(isinstance(snapshot.get(t),list) for t in TABLES):
        raise ValueError('Snapshot is missing required tables. Nothing uploaded.')
    payload={'format':'culture-atlas-backup-v1','created_at':datetime.now(timezone.utc).isoformat(),
             'commit':os.environ.get('GITHUB_SHA','local'),'database':snapshot,'files':files}
    payload['manifest']={'database_sha256':digest(canonical(snapshot)),
                         'files':{name:digest(text.encode()) for name,text in files.items()},
                         'counts':{t:len(snapshot[t]) for t in TABLES}}
    nonce=secrets.token_bytes(12)
    return MAGIC+nonce+AESGCM(encryption_key).encrypt(nonce,gzip.compress(canonical(payload)),MAGIC)

def unpack(blob,encryption_key):
    if not blob.startswith(MAGIC): raise ValueError('Not a Culture Atlas encrypted backup.')
    offset=len(MAGIC)
    try:
        payload=json.loads(gzip.decompress(AESGCM(encryption_key).decrypt(blob[offset:offset+12],blob[offset+12:],MAGIC)))
    except Exception:
        raise ValueError('Backup authentication/decryption failed. Check the key and file.') from None
    manifest=payload['manifest']
    if payload.get('format')!='culture-atlas-backup-v1' or digest(canonical(payload['database']))!=manifest['database_sha256']:
        raise ValueError('Database manifest verification failed.')
    if set(manifest['files'])!=set(payload['files']): raise ValueError('File manifest mismatch.')
    for name,text in payload['files'].items():
        if digest(text.encode())!=manifest['files'][name]: raise ValueError('File checksum failed.')
    if manifest['counts']!={t:len(payload['database'][t]) for t in TABLES}: raise ValueError('Row counts differ.')
    return payload

def upload_verified(storage,bucket,path,blob,encryption_key):
    storage.put_object(Bucket=bucket,Key=path,Body=blob,ContentType='application/octet-stream',IfNoneMatch='*')
    downloaded=storage.get_object(Bucket=bucket,Key=path)['Body'].read()
    if digest(downloaded)!=digest(blob): raise ValueError('Uploaded backup read-back differs.')
    return unpack(downloaded,encryption_key)

def backup():
    encryption_key=key()
    url=os.environ['SUPABASE_URL'].rstrip('/')
    if not url.startswith('https://') or not url.endswith('.supabase.co'): raise ValueError('Expected an HTTPS Supabase project URL.')
    token=os.environ['SUPABASE_SERVICE_ROLE_KEY']
    req=urllib.request.Request(url+'/rest/v1/rpc/culture_backup_snapshot',data=b'{}',method='POST',headers={'apikey':token,'Authorization':'Bearer '+token,'Content-Type':'application/json'})
    with urllib.request.urlopen(req,timeout=120) as response: snapshot=json.load(response)
    paths=[ROOT/'film-catalog.js',ROOT/'film-details.js',ROOT/'tv-catalog.js',ROOT/'tv-film-aliases.js',ROOT/'work-identities.js',ROOT/'supabase/schema.sql',*sorted((ROOT/'supabase/migrations').glob('*.sql'))]
    files={str(p.relative_to(ROOT)):p.read_text() for p in paths}
    blob=pack(snapshot,files,encryption_key)
    import boto3
    from botocore.config import Config
    account=os.environ['R2_ACCOUNT_ID']
    if not account.isalnum(): raise ValueError('Invalid R2 account ID')
    storage=boto3.client('s3',endpoint_url='https://'+account+'.r2.cloudflarestorage.com',region_name='auto',aws_access_key_id=os.environ['R2_ACCESS_KEY_ID'],aws_secret_access_key=os.environ['R2_SECRET_ACCESS_KEY'],config=Config(retries={'max_attempts':5,'mode':'standard'},request_checksum_calculation='when_required',response_checksum_validation='when_required'))
    path='culture-atlas/'+datetime.now(timezone.utc).strftime('%Y/%m/%d/%H%M%S-')+secrets.token_hex(8)+'.caenc'
    verified=upload_verified(storage,os.environ['R2_BUCKET'],path,blob,encryption_key)
    summary='Verified encrypted backup: '+path+'\n'+json.dumps(verified['manifest']['counts'],sort_keys=True)+'\n'
    print(summary)
    if os.environ.get('GITHUB_STEP_SUMMARY'):
        with open(os.environ['GITHUB_STEP_SUMMARY'],'a') as handle: handle.write(summary)

def inspect_backup(path,output):
    payload=unpack(Path(path).read_bytes(),key())
    print(json.dumps({'created_at':payload['created_at'],'commit':payload['commit'],'counts':payload['manifest']['counts']},indent=2))
    if output:
        dest=Path(output)
        # Extraction is deliberately offline and refuses to replace existing files.
        if dest.exists(): raise ValueError('Choose a new, empty output directory.')
        for name in payload['files']:
            rel=Path(name)
            if rel.is_absolute() or '..' in rel.parts: raise ValueError('Unsafe archive path.')
        dest.mkdir(parents=True,mode=0o700)
        (dest/'database.json').write_text(json.dumps(payload['database'],ensure_ascii=False,indent=2))
        (dest/'manifest.json').write_text(json.dumps(payload['manifest'],indent=2))
        for name,text in payload['files'].items():
            target=dest/'repository'/name;target.parent.mkdir(parents=True,exist_ok=True);target.write_text(text)
        print('Verified data extracted for review. No database changes made.')

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    sub=parser.add_subparsers(dest='command',required=True)
    sub.add_parser('backup')
    inspect=sub.add_parser('inspect');inspect.add_argument('file');inspect.add_argument('--extract',metavar='NEW_DIRECTORY')
    args=parser.parse_args()
    try:
        if args.command=='backup': backup()
        else: inspect_backup(args.file,args.extract)
    except Exception as error:
        # HTTP/provider errors can contain request URLs or tokens. Never dump responses.
        if isinstance(error,ValueError): print(str(error),file=sys.stderr)
        else: print('Backup failed ('+type(error).__name__+'). Check service availability and configured secrets.',file=sys.stderr)
        return 1
    return 0
if __name__=='__main__': sys.exit(main())
