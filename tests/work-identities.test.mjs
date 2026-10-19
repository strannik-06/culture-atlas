import assert from 'node:assert/strict';
import fs from 'node:fs';
import vm from 'node:vm';
import test from 'node:test';
const window = {};
vm.runInNewContext(fs.readFileSync(new URL('../work-identities.js', import.meta.url), 'utf8'), {window});
const identities = window.CULTURE_WORK_IDENTITIES;
const film = {id: 1920, tmdb_id: 42699, imdb_id: 'tt0094987', title: 'An episode already stored as a movie'};
const tv = {id: 'tv:1920', work_type: 'tv', tmdb_id: 1920, imdb_id: 'tt0098936', title: 'Twin Peaks'};

test('preserves numeric film IDs while separating equal numeric TV IDs', () => {
  const registry = identities.createRegistry([film], [tv]);
  assert.equal(registry.get('movie:1920').id, 1920);
  assert.equal(registry.get('tv:1920').title, 'Twin Peaks');
  assert.throws(() => registry.get(1920), /namespaced/);
  assert.equal(film.work_type, undefined);
});

test('separates equal TMDB movie and TV IDs', () => {
  const registry = identities.createRegistry([film], [{...tv, id: 'tv:42699', tmdb_id: 42699}]);
  assert.equal(registry.byExternalId('movie', 42699).id, 1920);
  assert.equal(registry.byExternalId('tv', 42699).work_key, 'tv:42699');
  assert.throws(() => registry.byExternalId(undefined, 42699), /media type/);
});

test('rejects duplicate work and IMDb identities instead of silently creating rating targets', () => {
  assert.throws(() => identities.createRegistry([film, film], []), /Duplicate work/);
  assert.throws(() => identities.createRegistry([film, {...film, id: 1921}], []), /Duplicate external/);
  assert.throws(() => identities.createRegistry([{...film, work_type: 'tv'}], []), /media type/);
  assert.throws(() => identities.createRegistry([film], [{...tv, imdb_id: film.imdb_id}]), /overlap/);
  assert.throws(() => identities.createRegistry([], [tv, tv]), /Duplicate work/);
  assert.throws(() => identities.createRegistry([], [{...tv, id: 1920}]), /namespaced/);
});

test('rejects lossy or invalid identities', () => {
  for (const id of [0, -1, 1.5, '1', NaN, Number.MAX_SAFE_INTEGER + 1]) {
    assert.throws(() => identities.movieKey(id), /positive integer/);
    assert.throws(() => identities.tvKey(id), /positive integer/);
  }
});

test('season keys remain distinct and do not masquerade as the parent show', () => {
  const seasons=[1,2].map(n=>({id:`tv:1455:season:${n}`,work_type:'tv',series_kind:'season',tmdb_id:1455,tmdb_media_type:'tv',season_number:n,imdb_id:n===1?'tt0112174':'tt0118476'}));
  const registry=identities.createRegistry([],seasons);
  assert.equal(registry.get('tv:1455:season:1').season_number,1);
  assert.equal(registry.get('tv:1455:season:2').season_number,2);
  assert.equal(registry.byExternalId('tv',1455),null);
  assert.throws(()=>identities.createRegistry([],[{...seasons[0],season_number:2}]),/exact parent and season/);
});

test('TV installments retain their actual provider namespace and reject duplicate film identities', () => {
  const installment={id:'tv:movie:126850',work_type:'tv',series_kind:'episode',tmdb_id:126850,tmdb_media_type:'movie',imdb_id:'tt0229922'};
  const registry=identities.createRegistry([],[installment]);
  assert.equal(registry.byExternalId('movie',126850).work_key,installment.id);
  assert.equal(registry.byExternalId('tv',126850),null);
  assert.throws(()=>identities.createRegistry([{id:3000,tmdb_id:126850}],[installment]),/Duplicate external/);
});

test('manual identities require evidence without made-up provider IDs', () => {
  const manual={id:'tv:imdb:tt4324832',work_type:'tv',tmdb_id:null,imdb_id:'tt4324832',identity_status:'manual_verified',evidence_urls:['https://www.imdb.com/title/tt4324832/']};
  const opening={...manual,id:'tv:local:tatarskiy-opening',imdb_id:null};
  const registry=identities.createRegistry([],[manual,opening]);
  assert.equal(registry.list().length,2);
  assert.equal(registry.get(manual.id).imdb_id,'tt4324832');
  for(const invalid of [{...manual,tmdb_id:123},{...manual,evidence_urls:[]},{...manual,imdb_id:'tt4324833'}])assert.throws(()=>identities.createRegistry([],[invalid]));
});
