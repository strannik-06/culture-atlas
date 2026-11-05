# Film awards and festivals 2011–2015

Thirty editions extend Oscars, BAFTA, Golden Globes, Cannes, Venice and Berlinale back through 2011. Ceremony/festival edition years are used consistently, with sourced actual dates for every edition.

| Event | Included scope | Nomination/selection records |
| --- | --- | ---: |
| Oscars | Eleven established major film categories | 293 |
| BAFTA | Established major film categories; Documentary from 2012 | 285 |
| Golden Globes | Twelve film categories | 299 |
| Cannes | Main Competition and Un Certain Regard | 197 |
| Venice | Venezia Competition and feature Orizzonti competition | 197 |
| Berlinale | Main Competition | 92 |

The 1,363 records resolve to 689 distinct films: 133 existing identities and 556 additions. The identity audit covers 931 source identities, with zero unresolved matches. Historical nominee counts and category availability are preserved: for example, only three Oscar animation nominees in 2011, no BAFTA Documentary category in 2011, and six Golden Globes Drama nominees in 2012. All earlier catalogue/detail records and award editions remain unchanged.

Official source JSON, event-specific notes, reviewed title/director aliases and individual film URLs provide the evidence. Contemporary award announcements correct archive errors: the Academy’s Les Mis_rables typo, BAFTA’s truncated Les Misérables credits and Kim McCraw misspelling, and the Golden Globes’ missing Steven Zaillian screenplay credit. Shared prizes and ensemble performers stay attached to the appropriate films.

Venice’s older Orizzonti programme mixes formats. The source notes document feature selections, exclusions of short/medium works and special screenings, Nocturnos’ contemporary feature listing, early technical prizes and both performances covered by the 2012 Falco award. Berlinale has no Encounters section in these years. Cannes’ 2013 Palme d’or preserves all three named recipients. Eleanor Rigby is the Cannes 2014 Them version, with the official interview distinguishing it from Him/Her.

## Complete-film provider exception

George Harrison: Living in the Material World is represented once as the complete 208-minute cinema documentary, IMDb tt1113829. Official artist/distributor evidence confirms its 2011 cinema release and full runtime. Its available TMDB identity is the two-part TV presentation, verified by title, IMDb, year, episode count and cast. The catalogue stores this as tmdb_tv_id 43107, with no fabricated movie-provider ID; the provider link is tv:43107 pointing to its numeric movie work. The reviewed complete-film status, scope and primary evidence are mandatory. Movie-only metadata refresh skips this curated exception. An invalid movie-ID discovery claim returned HTTP 404 and was rejected.

## Covers and metadata

All additions have synopsis and cover data. Three missing provider posters use reviewed official sources: Madame Courage’s producer poster, The Flock of the Lord’s director-hosted film still and Shock Head Soul’s producer promotional artwork. The latter two are explicitly documented as non-poster covers, with source links and image kinds retained. Existing covers and metadata are unchanged.

## Validation and registration

Checks compare every source nomination, selection, person and prize; verify all main-prize winners, sourced date coverage, prior-edition preservation, catalogue/detail fingerprints and namespaced provider handling. Isolated SQL tests apply the registration twice, preserve curated records and private ratings/notes, check the documentary’s TV-provider namespace and reject identity conflicts. Browser QA covers all thirty new editions, dates, winner filters, year navigation, refresh and mobile layout without contacting the live database.

The read-only Supabase preflight found zero existing rows, provider links or identity conflicts for all 556 additions. After merge, apply imports/film-awards-2011-2015-catalogue-sync.sql: it registers 556 catalogue identities and 556 provider links (555 movie providers and one reviewed TV provider). It is insert-only, repeatable and conflict-guarded. No schema, personal-data writes, review enrichment or live registrations are performed by this PR.
