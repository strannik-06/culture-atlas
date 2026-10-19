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
