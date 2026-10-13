# Phase 2A — Awards coverage audit (initial baseline)

Scope: 2024 and 2025 festival/ceremony editions; festival main competitions and major categories only for Oscars, Golden Globes, and existing BAFTA. Festival/ceremony year is independent of film release year. All film references must use the canonical `film-catalog.js` IDs.

## Current repository baseline (2025)
| Event | Film records | State | Action |
|---|---:|---|---|
| Cannes | 22 | Main Competition | Cross-check final competition list and awards against official Cannes records; opening-film/out-of-competition distinctions matter |
| Venice | 21 | Venezia 82 Competition | Verify final competition and prizes against La Biennale |
| Berlinale | 8 | Major winners only | Expand to full Competition; preserve awards |
| Oscars | 26 | 11 major categories | Audit nominees and winners against Academy ceremony records |
| BAFTA | 34 | 12 major categories | Preserve existing data; audit major-category coverage |
| Golden Globes | 0 | Missing | Add major film categories and nominees/winners |

## Official primary references
- Cannes 2025 selections: https://www.festival-cannes.com/en/press/press-releases/the-films-of-the-official-selection-2025/
- Cannes 2025 latest competition addition: https://www.festival-cannes.com/en/press/press-releases/official-selection-of-the-78th-festival-de-cannes-latest-announcements/
- Venice 2025 lineup: https://www.labiennale.org/en/cinema/2025/lineup
- Berlinale 2025 Competition: https://www.berlinale.de/en/2025/topics/competition-2025-2.html
- Berlinale 2025 winners: https://www.berlinale.de/en/archive/awards-juries/awards.html/o%3Ddesc/p%3D1/rp%3D40

## Implementation acceptance criteria
1. Every official Main Competition film is represented exactly once per festival event.
2. Every in-scope category contains the correct nominees and winner(s), verified against official sources.
3. All film references resolve to unique canonical IDs and TMDB identities; no duplicate master records.
4. Film display year comes from TMDB; collection year stays festival/ceremony year.
5. Preserve existing BAFTA data while adding Golden Globes, unless scope changes.
6. Document exceptions (e.g. ties, joint awards, festival late additions, categories awarded to people) rather than silently simplifying.
7. Changes ship in separate reviewable PRs, not auto-merged.

## Next implementation order
- Phase 2B: Complete and verify 2025, beginning with Berlinale and Golden Globes.
- Phase 2C: Add equivalent 2024 collections.
- Phase 2D: Update UI and award/category navigation.
- Phase 2E: Add reference-data-backed completeness tests.
