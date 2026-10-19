// Cross-media catalogue identities only. This module never reads or writes progress.
(function (root) {
  'use strict';
  function positiveId(id) {
    if (!Number.isSafeInteger(id) || id <= 0) throw new TypeError('Expected a positive integer identity');
    return id;
  }
  function movieKey(legacyFilmId) { return 'movie:' + positiveId(legacyFilmId); }
  function tvKey(tmdbTvId) { return 'tv:' + positiveId(tmdbTvId); }
  function externalKey(type, id) {
    if (!['movie', 'tv'].includes(type)) throw new TypeError('Explicit movie or tv media type required');
    return type + ':' + positiveId(id);
  }
  function createRegistry(films, series) {
    const works = new Map(), external = new Map(), imdb = new Map();
    function add(work, key, type) {
      if (works.has(key)) throw new Error('Duplicate work key ' + key);
      const ext = externalKey(type, work.tmdb_id);
      if (external.has(ext)) throw new Error('Duplicate external identity ' + ext);
      if (work.imdb_id && imdb.has(work.imdb_id)) throw new Error('IMDb identity already represented: ' + work.imdb_id + '; review cross-media overlap');
      const entry = Object.freeze({...work, work_key: key, work_type: type});
      works.set(key, entry); external.set(ext, entry);
      if (work.imdb_id) imdb.set(work.imdb_id, key);
    }
    for (const film of films) {
      if (film.work_type !== undefined && film.work_type !== 'movie') throw new Error('Movie registry received another media type');
      add(film, movieKey(film.id), 'movie');
    }
    for (const show of series) {
      if (show.work_type !== 'tv' || show.id !== tvKey(show.tmdb_id)) throw new Error('TV catalogue requires an explicit namespaced identity');
      add(show, show.id, 'tv');
    }
    return Object.freeze({
      get(key) {
        if (typeof key !== 'string' || !/^(movie|tv):[1-9]\d*$/.test(key)) throw new TypeError('Explicit namespaced work key required');
        return works.get(key) || null;
      },
      byExternalId(type, id) { return external.get(externalKey(type, id)) || null; },
      list(type) {
        if (type !== undefined && !['movie', 'tv'].includes(type)) throw new TypeError('Unknown media type');
        return [...works.values()].filter(work => type === undefined || work.work_type === type);
      }
    });
  }
  root.CULTURE_WORK_IDENTITIES = Object.freeze({movieKey, tvKey, createRegistry});
})(window);
