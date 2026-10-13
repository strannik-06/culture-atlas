# Berlinale 2025 — official Competition audit

**Primary sources:** [Berlinale official Competition overview](https://www.berlinale.de/en/2025/topics/competition-2025-2.html), [official 2025 press dossier, competition films](https://b2b.berlinale.de/en/downloads/download_document/3392/original/pressedossier-2025__1_.pdf), [official international jury awards](https://www.berlinale.de/en/archive/awards-juries/awards.html/o%3Ddesc/p%3D1/rp%3D40).

**Official Competition:** 19 films. **Currently in Culture Atlas:** 8 prize-winning films. **Missing:** 11. Do not mark the event as complete until all 19 are present with validated canonical IDs and TMDB identities.

| Official Competition film | Director | Current canonical ID | Status |
|---|---|---:|---|
| Ari | Léonor Serraille | — | Missing |
| Blue Moon | Richard Linklater | 36 | Present, Silver Bear supporting performance |
| The Safe House (La cache) | Lionel Baier | — | Missing |
| Dreams | Michel Franco | — | Missing; distinct from Dreams (Sex Love) |
| Dreams (Sex Love) | Dag Johan Haugerud | 31 | Present, Golden Bear |
| What Does that Nature Say to You | Hong Sang-soo | — | Missing |
| Hot Milk | Rebecca Lenkiewicz | — | Missing |
| If I Had Legs I'd Kick You | Mary Bronstein | 35 | Present, Silver Bear leading performance |
| Kontinental '25 | Radu Jude | 13 | Present, Silver Bear screenplay |
| The Message | Iván Fund | 33 | Present, Silver Bear Jury Prize |
| Mother's Baby | Johanna Moder | — | Missing |
| The Blue Trail | Gabriel Mascaro | 32 | Present, Silver Bear Grand Jury Prize |
| Reflection in a Dead Diamond | Hélène Cattet and Bruno Forzani | — | Missing |
| Living the Land | Huo Meng | 34 | Present, Silver Bear directing |
| Girls on Wire | Vivian Qu | — | Missing |
| Timestamp | Kateryna Gornostai | — | Missing |
| The Ice Tower | Lucile Hadžihalilović | 14 | Present, Silver Bear artistic contribution |
| What Marielle Knows | Frédéric Hambalek | — | Missing |
| Yunan | Ameer Fakher Eldin | — | Missing |

## Next data PR acceptance criteria
1. Add the 11 missing films to `film-catalog.js` with new stable numeric IDs and independently verified TMDB IDs; never reuse existing IDs or match the two different films named *Dreams*.
2. Add the 11 film references to the Berlinale event in `awards-2025.js`, keeping all eight existing prize records.
3. Change section to `Main Competition` and remove `scope: "winners"` **only when** all 19 are present.
4. Run `node scripts/validate-catalog.mjs`, TMDB identity audit and metadata refresh. Check all 19 film cards and awards display.
5. Keep official selections and results URLs visible and preserve festival dates (13–23 February) and awards date (22 February).
