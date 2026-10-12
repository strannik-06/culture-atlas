// Verified enrichment records keyed by Culture Atlas film ID.
// Leave unavailable fields blank rather than inventing scores or review links.
// Poster URLs must come from matched TMDB movie IDs and approved TMDB image paths.
// Example shape (replace only with verified values):
// 1: {poster: 'https://image.tmdb.org/t/p/w500/...', cast: ['Actor One'], awards: 'Festival / award distinction', imdb: {url: 'https://www.imdb.com/title/...',score:'7.8/10'}, letterboxd: {url:'https://letterboxd.com/film/...',score:'3.9/5'}, reviews:{guardian:{url:'https://www.theguardian.com/...',score:'4/5'},ebert:{url:'https://www.rogerebert.com/reviews/...',score:'3/4'}}}
window.CULTURE_FILM_DETAILS = {};
