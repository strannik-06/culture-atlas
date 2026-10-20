import importlib.util
import io
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

def load(name,file):
    spec=importlib.util.spec_from_file_location(name,Path(__file__).resolve().parents[1]/'scripts'/file)
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);return module
backup=load('backup','backup.py');restore=load('restore','restore-backup.py')
class BackupTests(unittest.TestCase):
    def setUp(self):
        self.key=b'x'*32
        self.snapshot={t:[] for t in backup.TABLES}
        self.snapshot['film_progress']=[{'user_id':'00000000-0000-0000-0000-000000000001','film_id':31,'rating':7,'notes':"Private O'Brien $$ note"}]
    def test_encryption_manifest_tamper_and_wrong_key(self):
        blob=backup.pack(self.snapshot,{'film-catalog.js':'catalogue'},self.key)
        self.assertNotIn(b'Private',blob)
        data=backup.unpack(blob,self.key)
        self.assertEqual(data['database'],self.snapshot)
        self.assertEqual(data['manifest']['counts']['film_progress'],1)
        with self.assertRaises(ValueError): backup.unpack(blob[:-1]+bytes([blob[-1]^1]),self.key)
        with self.assertRaises(ValueError): backup.unpack(blob,b'y'*32)
        with self.assertRaises(ValueError): backup.pack({}, {}, self.key)
    def test_storage_readback_required_and_unique_upload_guard(self):
        blob=backup.pack(self.snapshot,{},self.key)
        class Storage:
            def put_object(inner,**kwargs): inner.args=kwargs
            def get_object(inner,**kwargs): return {'Body':io.BytesIO(blob)}
        storage=Storage();backup.upload_verified(storage,'private','unique.caenc',blob,self.key)
        self.assertEqual(storage.args['IfNoneMatch'],'*')
        storage.get_object=lambda **kwargs:{'Body':io.BytesIO(b'bad')}
        with self.assertRaises(ValueError): backup.upload_verified(storage,'private','other.caenc',blob,self.key)
    def test_offline_extraction_and_insert_only_recovery(self):
        blob=backup.pack(self.snapshot,{'film-catalog.js':'catalogue'},self.key)
        with tempfile.TemporaryDirectory() as tmp,patch.object(backup,'key',return_value=self.key):
            path=Path(tmp)/'snapshot.caenc';path.write_bytes(blob);out=Path(tmp)/'verified'
            backup.inspect_backup(path,out)
            self.assertEqual(json.loads((out/'database.json').read_text()),self.snapshot)
            with self.assertRaises(ValueError): backup.inspect_backup(path,out)
        sql=restore.make_sql(self.snapshot)
        self.assertIn("O''Brien $$ note",sql);self.assertIn('on conflict do nothing',sql)
        self.assertIn('Missing original auth users',sql)
        self.assertNotIn('do update',sql.lower());self.assertNotIn('delete from',sql.lower())
        self.snapshot['film_progress'][0]['bad;column']=1
        with self.assertRaises(ValueError): restore.make_sql(self.snapshot)
if __name__=='__main__': unittest.main()
