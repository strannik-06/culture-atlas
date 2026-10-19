// Cross-media catalogue identities only. This module never reads or writes progress.
(function (root) {
  'use strict';
  function positiveId(id) {
    if (!Number.isSafeInteger(id) || id <= 0) throw new TypeError('Expected a positive integer identity');
    return id;
  }
  function movieKey(legacyFilmId) { return 'movie:' + positiveId(legacyFilmId); }
  function tvKey(tmdbTvId) { return 'tv:' + positiveId(tmdbTvId); }
  const tvKeyPattern = /^tv:(?:[1-9]\d*(?::season:[1-9]\d*)?|movie:[1-9]\d*|imdb:tt\d{6,}|local:[a-z0-9]+(?:-[a-z0-9]+)*)$/;
  function tvIdentity(work) {
    const key = work.id;
    if (typeof key !== 'string' || !tvKeyPattern.test(key)) throw new Error('TV catalogue requires an explicit namespaced identity');
    const season = /^tv:([1-9]\d*):season:([1-9]\d*)$/.exec(key);
    const movie = /^tv:movie:([1-9]\d*)$/.exec(key);
    const manual = /^tv:(imdb:tt\d{6,}|local:[a-z0-9]+(?:-[a-z0-9]+)*)$/.exec(key);
    if (season) {
      if (work.series_kind !== 'season' || work.tmdb_id !== Number(season[1]) || work.season_number !== Number(season[2]) || work.tmdb_media_type !== 'tv') throw new Error('Season identity must specify its exact parent and season');
      positiveId(work.tmdb_id); positiveId(work.season_number);
      return {key, ext: key}; // Never resolve a parent show lookup to just one season.
    }
    if (movie) {
      if (work.series_kind !== 'episode' || work.tmdb_media_type !== 'movie' || work.tmdb_id !== Number(movie[1])) throw new Error('Installment identity requires its reviewed movie-provider record');
      return {key, ext: externalKey('movie', work.tmdb_id)};
    }
    if (manual) {
      if (work.tmdb_id !== null || work.identity_status !== 'manual_verified' || !Array.isArray(work.evidence_urls) || !work.evidence_urls.length || work.evidence_urls.some(url => typeof url !== 'string' || !/^https:\/\//.test(url))) throw new Error('Manual identity requires explicit evidence and no invented TMDB ID');
      if (key.startsWith('tv:imdb:') ? key !== 'tv:imdb:' + work.imdb_id : work.imdb_id !== null) throw new Error('Manual external identity mismatch');
      return {key, ext: null};
    }
    if (key !== tvKey(work.tmdb_id) || (work.tmdb_media_type !== undefined && work.tmdb_media_type !== 'tv')) throw new Error('TV catalogue identity mismatch');
    return {key, ext: externalKey('tv', work.tmdb_id)};
  }
  function externalKey(type, id) {
    if (!['movie', 'tv'].includes(type)) throw new TypeError('Explicit movie or tv media type required');
    return type + ':' + positiveId(id);
  }
  function createRegistry(films, series, aliases = []) {
    const works = new Map(), external = new Map(), imdb = new Map();
    function add(work, key, type, ext = externalKey(type, work.tmdb_id)) {
      if (works.has(key)) throw new Error('Duplicate work key ' + key);
      if (ext && external.has(ext)) throw new Error('Duplicate external identity ' + ext);
      if (work.imdb_id && imdb.has(work.imdb_id)) throw new Error('IMDb identity already represented: ' + work.imdb_id + '; review cross-media overlap');
      const entry = Object.freeze({...work, work_key: key, work_type: type});
      works.set(key, entry); if (ext) external.set(ext, entry);
      if (work.imdb_id) imdb.set(work.imdb_id, key);
    }
    for (const film of films) {
      if (film.work_type !== undefined && film.work_type !== 'movie') throw new Error('Movie registry received another media type');
      add(film, movieKey(film.id), 'movie');
    }
    for (const show of series) {
      if (show.work_type !== 'tv') throw new Error('TV catalogue requires an explicit namespaced identity');
      const {key, ext} = tvIdentity(show);
      add(show, key, 'tv', ext);
    }
    for (const alias of aliases) {
      const target = works.get(alias.work_key);
      const ext = externalKey(alias.media_type, alias.tmdb_id);
      if (!target || target.work_type !== 'movie' || alias.media_type !== 'tv'
          || !alias.imdb_id || target.imdb_id !== alias.imdb_id || external.has(ext)) {
        throw new Error('Invalid or conflicting reviewed movie/TV alias');
      }
      external.set(ext, target);
    }
    return Object.freeze({
      get(key) {
        if (typeof key !== 'string' || !(/^movie:[1-9]\d*$/.test(key) || tvKeyPattern.test(key))) throw new TypeError('Explicit namespaced work key required');
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
