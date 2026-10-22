#!/usr/bin/env python3
"""Produce a reviewable, insert-only recovery SQL file from a verified extracted snapshot.
Never connects to a database. Existing catalogue and progress rows are preserved.
"""
import argparse
import json
from pathlib import Path
import re

TABLES=('media_catalogue','media_provider_links','books','film_progress','tv_progress','book_progress')
def make_sql(snapshot):
    if not all(isinstance(snapshot.get(t),list) for t in TABLES): raise ValueError('Missing snapshot tables')
    lines=['-- Recovery proposal: inspect before running. Existing rows are never overwritten.',
           '-- Requires the backed-up schema/migrations and the original Supabase auth users.',
           'begin;']
    users=sorted({r['user_id'] for t in ('film_progress','tv_progress','book_progress','book_readings') for r in snapshot.get(t,[])})
    if any(not re.fullmatch(r'[0-9a-fA-F-]{36}',u) for u in users): raise ValueError('Invalid user ID')
    if users:
        values=','.join("('"+u+"'::uuid)" for u in users)
        lines.append("do $$begin if exists(select 1 from (values "+values+") expected(id) where not exists(select 1 from auth.users where users.id=expected.id)) then raise exception 'Missing original auth users: restore or explicitly map accounts before recovery'; end if; end$$;")
    if 'book_readings' in snapshot and not isinstance(snapshot['book_readings'],list): raise ValueError('Invalid reading history table')
    for table in TABLES + (('book_readings',) if 'book_readings' in snapshot else ()):
        rows=snapshot[table]
        if not rows: continue
        columns=sorted({k for r in rows for k in r})
        if any(not re.fullmatch('[a-z_][a-z_0-9]*',c) for c in columns): raise ValueError('Invalid column name')
        cols=','.join('"'+c+'"' for c in columns)
        literal="'"+json.dumps(rows,ensure_ascii=False).replace("'","''")+"'::jsonb"
        lines.append(f'insert into public.{table} ({cols}) select {cols} from jsonb_populate_recordset(null::public.{table},{literal}) on conflict do nothing;')
    lines.extend(["select setval('public.media_film_ids',greatest((select last_value from public.media_film_ids),coalesce((select max(film_id) from public.media_catalogue),1000000000)),true);",
                  "select setval(pg_get_serial_sequence('public.books','id'),greatest(coalesce((select max(id) from public.books),1),coalesce(pg_sequence_last_value(pg_get_serial_sequence('public.books','id')::regclass),1)),true);",
                  'commit;'])
    return '\n'.join(lines)+'\n'

def main():
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('database_json');parser.add_argument('output_sql');args=parser.parse_args()
    sql=make_sql(json.loads(Path(args.database_json).read_text()))
    with open(args.output_sql,'x') as handle: handle.write(sql)
    print('Created insert-only recovery SQL. Review before running; no database connection was made.')
if __name__=='__main__': main()
