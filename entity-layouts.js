/* Presentation preferences are scoped to an account and a stable page key. */
(() => {
 'use strict';
 const storagePrefix = 'culture-atlas-layouts:';
 const table = 'entity_layout_preferences';
 const views = new Map();
 const icons = {
  cards: '<rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/>',
  list: '<path d="M8 5h13M8 12h13M8 19h13M3 5h.01M3 12h.01M3 19h.01"/>'
 };
 let client;
 let account = {id:null, choices:read(null), syncing:new Set(), changed:new Set()};

 function valid(layout) {
  return layout === 'cards' || layout === 'list';
 }

 function read(id) {
  try {
   const stored = JSON.parse(localStorage.getItem(storagePrefix + (id || 'guest')) || '{}');
   return new Map(Object.entries(stored).filter(([, choice]) => valid(choice?.layout)));
  } catch {
   return new Map();
  }
 }

 function persist(state) {
  try {
   localStorage.setItem(storagePrefix + (state.id || 'guest'), JSON.stringify(Object.fromEntries(state.choices)));
  } catch {
   // The controls still work when browser storage is blocked.
  }
 }

 function paint(view) {
  const choice = account.choices.get(view.key);
  const layout = choice?.layout || view.defaultLayout;
  view.grid.dataset.entityLayout = layout;
  for (const button of view.buttons) {
   button.setAttribute('aria-pressed', String(button.dataset.layoutChoice === layout));
  }
 }

 async function sync(state, key) {
  if (!state.id || !client || state !== account || state.syncing.has(key)) return;
  state.syncing.add(key);
  try {
   while (state === account) {
    const choice = state.choices.get(key);
    if (!choice?.pending) break;
    const {error} = await client.from(table).upsert(
     {user_id:state.id, page_key:key, layout:choice.layout},
     {onConflict:'user_id,page_key'}
    );
    if (error) break;
    if (state.choices.get(key) === choice) {
     choice.pending = false;
     persist(state);
    }
   }
  } catch {
   // Keep the pending choice for the next sign-in, page load or online event.
  } finally {
   state.syncing.delete(key);
  }
 }

 async function setSession(user) {
  const id = user && !user.is_anonymous ? user.id : null;
  if (id === account.id) return;
  const state = {id, choices:read(id), syncing:new Set(), changed:new Set()};
  account = state;
  views.forEach(paint);
  if (!id || !client) return;
  try {
   const {data, error} = await client.from(table).select('page_key,layout').eq('user_id', id);
   if (account !== state) return;
   if (!error && Array.isArray(data)) {
    for (const row of data) {
     if (valid(row.layout) && !state.choices.get(row.page_key)?.pending && !state.changed.has(row.page_key)) {
      state.choices.set(row.page_key, {layout:row.layout});
     }
    }
    persist(state);
    views.forEach(paint);
   }
  } catch {
   // Cached preferences stay available during a failed request.
  }
  if (account === state) {
   for (const key of state.choices.keys()) void sync(state, key);
  }
 }

 function mount(grid, anchor, key, defaultLayout = 'cards') {
  if (!grid || !anchor) return;
  let view = views.get(grid);
  if (!view) {
   const toolbar = document.createElement('div');
   toolbar.className = 'entity-layout-toolbar';
   const group = document.createElement('div');
   group.className = 'entity-layout-switch';
   group.setAttribute('role', 'group');
   group.setAttribute('aria-label', 'Results layout');
   const buttons = Object.entries(icons).map(([layout, icon]) => {
    const button = document.createElement('button');
    button.type = 'button';
    button.dataset.layoutChoice = layout;
    button.setAttribute('aria-label', layout === 'cards' ? 'Cards view' : 'List view');
    button.title = button.getAttribute('aria-label');
    button.setAttribute('aria-controls', grid.id);
    button.innerHTML = '<svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" aria-hidden="true">' + icon + '</svg>';
    button.addEventListener('click', () => {
     const state = account;
     if ((state.choices.get(view.key)?.layout || view.defaultLayout) === layout) return;
     state.choices.set(view.key, {layout, pending:!!state.id});
     state.changed.add(view.key);
     persist(state);
     views.forEach(paint);
     void sync(state, view.key);
    });
    group.append(button);
    return button;
   });
   anchor.before(toolbar);
   toolbar.append(anchor, group);
   view = {grid, group, buttons};
   views.set(grid, view);
  }
  view.key = key;
  view.defaultLayout = defaultLayout;
  paint(view);
  return view.group;
 }

 function formatRuntime(minutes) {
  return Number.isInteger(minutes) && minutes > 0 ? minutes + ' min' : '';
 }

 function summary(markup) {
  return markup ? '<div class="entity-summary"><div class="entity-summary-preview" inert>' + markup + '</div></div>' : '';
 }

 window.addEventListener('online', () => {
  for (const key of account.choices.keys()) void sync(account, key);
 });
 window.CultureLayouts = {init(value) { client = value; }, mount, setSession, summary, formatRuntime};
})();
