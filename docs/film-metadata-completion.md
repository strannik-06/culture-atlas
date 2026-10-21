# Film metadata completion

The catalogue contains 2,252 canonical films. Before this update, 243 had metadata records; missing fields were filled for another 2,009 entries. Canonical film IDs, titles, director identities, reviewed links and personal ratings were not replaced.

| Field | Before | After |
| --- | ---: | ---: |
| Cover image | 243 | 2,252 |
| Synopsis | 243 | 2,252 |
| Release date | 243 | 2,252 |
| Genres | 243 | 2,252 |
| Production countries | 243 | 2,250 |
| Runtime | 243 | 2,239 |
| Cast | 239 | 2,225 |

Existing nonempty metadata was retained. All 3,884 existing populated values were checked against the previous snapshot and preserved. There were no TMDB/IMDb identity conflicts.

Most fields came from the previously verified TMDB movie IDs. Five missing English synopses use the original-language Russian TMDB description instead. No new film identity search or rating import was performed.

## Two fallback covers

- **Cardiogram of Love** (1451): an official production still from [FILM.UA](https://film.ua/en/production/filmsandseries/projects/207), which also supplies the missing 90-minute runtime. This is a cover image, not a newly invented theatrical poster.
- **Lost and Found: Film 3** (2175): the cover from its [specific Kinopoisk entry](https://www.kinopoisk.ru/film/257394/), explicitly labelled “Фильм третий”. Other parts were not substituted. Its [KinoNews listing](https://www.kinonews.ru/movie_349251/byuro-nahodok-film-3) independently confirms the identity and Soviet animation metadata.

Both images are stored locally for reliable display, and their film detail pages link to the sources. The reviewed supplements for the Lost and Found trilogy are recorded in [film-metadata-overrides.json](../imports/film-metadata-overrides.json).

## Remaining optional gaps

TMDB still has no runtime for 13 records, no production countries for two records, and no cast list for 27 records. These fields remain blank rather than being guessed. Many cast gaps are documentaries or nonverbal animation. Every film nevertheless now has a cover, synopsis, release date and genre. The exact remaining records and fields are listed in [the completion audit](../imports/film-metadata-completion.json).

## Repeating the fill

The **Fill missing film metadata** Actions workflow supports a manual run using the repository's existing TMDB secret. It fills only empty fields, validates the existing TMDB/IMDb identity, retries transient requests, tries alternative posters and original-language synopses, and records verified manual supplements. On the dedicated review branch it commits the updated metadata/audit; a manual run on another branch does not push changes automatically. It never accesses Supabase progress or authentication data.
