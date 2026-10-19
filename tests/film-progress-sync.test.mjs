import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import vm from 'node:vm';

const html = fs.readFileSync(new URL('../index.html', import.meta.url), 'utf8');
const start = html.indexOf('async function loadCloudProgress(user){');
const end = html.indexOf('\nasync function updateAuth(', start);
assert(start >= 0 && end > start);
const implementation = html.slice(start, end);

function harness(pages, initial) {
  const storage = new Map();
  const calls = [];
  const messages = [];
  let renders = 0;
  const query = {
    select(fields) { calls.push(['select', fields]); return this; },
    eq(field, value) { calls.push(['eq', field, value]); return this; },
    order(field, options) { calls.push(['order', field, options]); return this; },
    async range(from, to) { calls.push(['range', from, to]); return pages[from / 500]; },
    upsert() { throw Error('Sync must never write progress'); },
    insert() { throw Error('Sync must never insert progress'); },
  };
  const context = vm.createContext({
    progress: initial,
    key: 'films-test',
    supabaseClient: { from(table) { assert.equal(table, 'film_progress'); return query; } },
    localStorage: { getItem(key) { return storage.get(key) ?? null; }, setItem(key, value) { storage.set(key, value); } },
    setAuthMessage(message) { messages.push(message); },
    render() { renders += 1; },
  });
  vm.runInContext(implementation, context);
  return { context, storage, calls, messages, get renders() { return renders; } };
}

test('successful sync removes stale deleted ratings without uploading browser-only rows', async () => {
  const initial = { 229: { watched: true, rating: 7 }, 999: { watched: true, rating: 8 } };
  const h = harness([{ data: [{ film_id: 31, watched: true, rating: 7 }], error: null }], initial);
  await h.context.loadCloudProgress({ id: 'owner' });
  assert.equal(JSON.stringify(h.context.progress), JSON.stringify({ 31: { watched: true, rating: 7 } }));
  assert.deepEqual(JSON.parse(h.storage.get('films-test:before-cloud:owner')), initial);
  assert.equal(h.storage.get('films-test'), JSON.stringify(h.context.progress));
  assert.equal(h.renders, 1);
});

test('cloud pagination includes ratings beyond the first 500', async () => {
  const first = Array.from({ length: 500 }, (_, i) => ({ film_id: i + 1, watched: true, rating: 7.5 }));
  const h = harness([{ data: first, error: null }, { data: [{ film_id: 501, watched: true, rating: 8 }], error: null }], {});
  await h.context.loadCloudProgress({ id: 'owner' });
  assert.equal(Object.keys(h.context.progress).length, 501);
  assert.equal(h.context.progress[501].rating, 8);
  assert.deepEqual(h.calls.filter(c => c[0] === 'range'), [['range', 0, 499], ['range', 500, 999]]);
});

test('failed cloud reads preserve the current cache instead of deleting or publishing it', async () => {
  const initial = { 229: { watched: true, rating: 7 } };
  const first = Array.from({ length: 500 }, (_, i) => ({ film_id: i + 1, watched: true, rating: 8 }));
  const h = harness([{ data: first, error: null }, { data: null, error: { message: 'offline' } }], initial);
  await h.context.loadCloudProgress({ id: 'owner' });
  assert.equal(h.context.progress, initial);
  assert.equal(h.storage.size, 0);
  assert.equal(h.renders, 0);
  assert.match(h.messages[0], /no progress was replaced/);
});

test('an existing recovery snapshot is not overwritten by later refreshes', async () => {
  const h = harness([{ data: [], error: null }], { 31: { watched: true, rating: 7 } });
  h.storage.set('films-test:before-cloud:owner', 'original snapshot');
  await h.context.loadCloudProgress({ id: 'owner' });
  assert.equal(h.storage.get('films-test:before-cloud:owner'), 'original snapshot');
  assert.equal(Object.keys(h.context.progress).length, 0);
});
