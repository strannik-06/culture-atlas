# Venice 2006–2010: official source audit

The batch includes Venezia Competition and the eligible competing feature/documentary selections in Orizzonti. Prizes annotate the selected films, using the historical prize categories rather than backfilling later categories.

| Edition | Venezia Competition | Orizzonti | Included prize categories | Festival dates |
|---|---:|---:|---:|---|
| 2006 | 22 | 19 | 12 | 30 August–9 September |
| 2007 | 23 | 22 | 11 | 29 August–8 September |
| 2008 | 21 | 20 | 11 | 27 August–6 September |
| 2009 | 25 | 24 | 12 | 2–12 September |
| 2010 | 24 | 21 | 11 | 1–11 September |
| Total | 115 | 106 | 57 | |

The source contains **221 selected film records and 57 prize categories**. Shared winning films and people are retained within each prize category.

## Primary source and collection

La Biennale's official ASAC annual records supply final section membership, jury prizes and dates:

- https://asac.labiennale.org/attivita/cinema/annali?anno=2006
- https://asac.labiennale.org/attivita/cinema/annali?anno=2007
- https://asac.labiennale.org/attivita/cinema/annali?anno=2008
- https://asac.labiennale.org/attivita/cinema/annali?anno=2009
- https://asac.labiennale.org/attivita/cinema/annali?anno=2010

Each film has an individual official archive URL, director, production year, runtime and original/distribution-title aliases. `scripts/collect-venice-2006-2010.py` reproduces the evidence through the public API used by the archive's own interface. `/api/ricerca-semplice` serves annual records with `callIndex: annali_cinema` and film records with `callIndex: cinema`; the collector verifies complete returned counts and rejects missing directors.

Festival boundaries are UTC instants representing midnight in Venice; they are converted to Europe/Rome calendar dates. The source includes exact festival ranges for all five years and separately dated award ceremonies where an explicit closing-ceremony record is present (2006 and 2008).

## Selection scope and archival exceptions

Through 2009, regular Orizzonti selections consist of competing feature/documentary works, with events stored separately. The batch retains the complete regular selections, including:

- *Il passaggio della linea* (2007), a 60-minute documentary incorrectly typed medium-length by ASAC. Producer [Indigo Film](https://www.indigofilm.it/produzione/il-passaggio-della-linea/) and [Filmitalia](https://filmitalia.org/en/film/41781/) verify the work, director and Orizzonti selection. There was no separate medium/short competition in these regular Orizzonti selections.
- *Wahed-Sefr* (2009), a 105-minute feature typed medium-length in ASAC, and *Woman on Fire Looks for Water* (2009), whose archive type is missing. Both remain in the official final Orizzonti membership. The latter was the late surprise selection, explaining why initial press announcements list 23 rather than the final 24 films.

In 2010, the archive's regular Orizzonti section combines 64 works: 21 features plus 43 short/medium works. Only its 21 features are included. The four separately classified out-of-competition works are excluded. The contemporary announcement independently describes this exact split: [MUBI Notebook, 28 July 2010](https://mubi.com/en/notebook/posts/venice-lineup-round-2-orizzonti-plus-more-fests). A simple runtime threshold would wrongly include 45–58-minute works in the separate short/medium programme; the collector follows the actual feature list instead. The medium-length prize for *Tse* and short-film prize for *Coming Attractions* are excluded.

The ASAC record for *Man from Plains* (2007) contains no people/crew fields. [Sony Pictures Classics' official non-theatrical catalogue](https://www.sonyclassics.com/downloads/Sony_Pictures_Classics_Non-Theatrical_Catalogue.pdf) verifies Jonathan Demme as director and the full release title *Jimmy Carter: Man from Plains*. This is the collector's single explicit director-completion exception; the extra primary source is retained on the film record.

## Historical prizes

The 2006–2009 Orizzonti Film and Documentary prizes are distinct and both retained. Their historical official names are stored alongside consistent display labels. The 2010 edition instead has its actual general Orizzonti Award, Special Jury Prize and Special Mention among the included features; no modern directing, acting or screenplay prizes are invented.

The main competition retains its contemporary Special Jury Prize, Osella technical/cinematography and screenplay prizes, and the 2006 Silver Lion — Revelation for *Nuovomondo*. The 2006 Special Lion for Cinematic Innovation is attached to *Quei loro incontri*, with both Danièle Huillet and Jean-Marie Straub named.

The joint 2007 Special Jury Prize retains both *I'm not there* and *La Graine et le mulet*. The 2008 cinematography Osella retains Alisher Khamidkhodjaev and Maksim Drozdov for *Bumazhnyy soldat*. Both 2008 Orizzonti Special Mention recipients, *Un lac* and *Wo Men*, remain represented.

The 2007 special Golden Lion for Nikita Mikhalkov and 2008 special Golden Lion for Werner Schroeter explicitly honor their overall body of work. They are excluded as personal honors, even though ASAC associates the respective competing films *12* and *Nuit de chien* with those records. Ordinary lifetime/honorary awards, independent juries, collateral awards and parallel sections are also excluded.

Lion of the Future appears only where the debut winner belongs to these included selections: *Engkwentro* (2009). Winners from the other four years belong to parallel sections and are outside this batch.

## Complete film: When the Levees Broke

The 2006 official film record, [ASAC 11292](https://asac.labiennale.org/attivita/cinema/11292), misspells “Levees” as “Leeves” but identifies Spike Lee's **complete 255-minute four-act documentary**. It won the Orizzonti Documentary Award. The normalized source preserves the archival title while identity aliases use the correctly spelled release title.

[MoMA's official complete-film screening](https://www.moma.org/calendar/events/10759) independently identifies the 2006 USA work, Spike Lee, a 255-minute DCP, and HBO as the source of the print. This establishes complete-film scope rather than an individual television act. IMDb's [full-work release record](https://www.imdb.com/title/tt0783612/releaseinfo/) lists 16 August 2006 in New Orleans, 21 August on HBO and 1 September at Venice.

The initial provider override tests TMDB movie **58923**, discovered from the [public BetaSeries external provider link](https://www.betaseries.com/en/movie/60922-when-the-levees-broke-a-requiem-in-four-acts). Generation must independently verify its API identity, title, director, IMDb ID and full runtime; this discovery alone does not approve a provider identity.

If that movie record has been retired, the alternative full-work provider record is TMDB TV **16468**, likewise subject to API checks. The TV-backed public metadata currently reports four 2006 episodes, whereas IMDb and HBO's licensed Google Play presentation also list a fifth episode, a later **2007 epilogue**. The film scope is the original four acts only, total 255 minutes; it excludes that epilogue. Provider episode counts must be checked against the actual API data, without treating the whole five-episode set or any single act as the festival film. Useful primary evidence:

- [HBO official series directory](https://www.hbo.com/series/a-z): describes the original four-part documentary event.
- [HBO's licensed episode listing](https://play.google.com/store/tv/show/When_the_Levees_Broke?hl=en_US&id=g2dOj0heDb8): explicitly distinguishes the four acts from the 2007 epilogue.
- [Peabody Awards](https://peabodyawards.com/award-profile/when-the-levees-broke-a-requiem-in-four-acts/): identifies the 2006 HBO work and Spike Lee as director.

No generated catalogue records, private ratings or live database rows are changed by source collection.

### Provider identity audit corrections

`imports/venice-2006-2010-identity-overrides.json` supplies all 45 first-pass unresolved source keys. Discovered IMDb IDs are anchors for provider `/find`, with title/year/credit checks retained. No provider identity is guessed from a generic title. ASAC disambiguators `(I)`/`(III)`, transliteration, abbreviated middle names and obvious spelling variants are reconciled explicitly.

Two provider directing credits conflict with primary sources: [Ross McElwee's own In Paraguay page](https://rossmcelwee.com/in-paraguay-1) says directed, filmed and edited by Ross McElwee alone; [Heimat sales agent](https://www.playmaker.de/films/heimat-fragments-the-women/) and [Arthaus distributor](https://www.arthaus.de/heimat_fragmente-die_frauen) credit Edgar Reitz alone. These retain authoritative sole-director credits rather than adding Marilyn Levine or Christian Reitz as directors. Conversely, [IFFR](https://iffr.com/en/iffr/2009/films/puisque-nous-sommes-n%C3%A9s) verifies both Duret/Santana for Because We Were Born, [Coproduction Office's press kit](https://coproductionoffice.eu/assets/films/women-without-men/presskit/WOMEN_BD310809.pdf) and [IFFR](https://iffr.com/en/iffr/2010/films/women-without-men) explain Azari's collaborating-director credit on Women Without Men, and [Khaled Youssef's film page](https://khaledyoussef.com/films/heya-fawda/) verifies Heya Fawda's co-signed directing credit.

Villalobos's ASAC production year is blank. [Contemporaneous Viennale programme](https://www.viennale.at/en/films/villalobos) and [filmmaker press dossier](https://static1.squarespace.com/static/5724ab6027d4bd23efd03ef6/t/58614c55725e25ca57927f41/1482771552355/VILLALOBOS_pressedossier.pdf) establish Germany 2009, 110 minutes; source and collector fill 2009.

The Levees movie-provider ID 58923 returns HTTP 404. The replacement override uses complete-film TV ID 16468, discovered through a [public provider-linked page](https://jephmann.com/movies/tv.php?id=16468), with 2006 year and four episodes subject to API verification. The represented work is the **complete original four acts**, 255 minutes, independently verified by [MoMA](https://www.moma.org/calendar/events/10759); the later 2007 epilogue is excluded. [IMDb release information](https://www.imdb.com/title/tt0783612/releaseinfo/) distinguishes the 16 August 2006 New Orleans premiere, 21 August HBO premiere and Venice screening. The IMDb series page counts the later epilogue as a fifth episode; that is not the original festival work's scope.

Bellissime 2, Non prendere impegni stasera, Quijote and Tris di donne & abiti nuziali receive explicit official ASAC runtime fallbacks (180/96/75/138 minutes), only for missing provider runtimes under generator validation. Reconstructing Faith has no discovered IMDb anchor; [Chinese Independent Film Archive](https://chinaindiefilm.com/films/reconstructing-faith/) verifies English title, director Wen Hai, 2010 and 79-minute archival version (Venice records 78). English-title search and full provider identity checks must resolve it.

Second identity audit: Il colore delle parole (70), Per questi stretti morire (90) and Madri (90) have zero provider runtimes; exact ASAC runtimes are supplied as missing-value fallbacks. Anabazys's expanded provider title is `Anabazys: O Terceiro Testamento de Glauber Rocha`, with the same two directors, 2007 year and IMDb tt1094235. Its provider runtime100 conflicts with Venice140; the [official Rosario 2012 programme](https://www.flvr2012.centroaudiovisual.gob.ar/page/fuera_de_competencia/id/9/title/El-cine-de-Glauber-Rocha) and [catalogue](https://flvr2012.centroaudiovisual.gob.ar/uploadsarchivos/catalogo2012.pdf) independently confirm the complete documentary at140. Preserve the documented Venice runtime; do not infer that Venice selected a100-minute version.

Reconstructing Faith has no discovered IMDb record after international, romanized and original-script title searches. The [Chinese Independent Film Archive](https://chinaindiefilm.com/films/reconstructing-faith/) is a primary alternative work-identity anchor (Wen Hai,2010,79minutes); Venice's78-minute programme is within one minute. Any registration fallback must explicitly represent reviewed official-source identity rather than inventing an IMDb ID.

Final provider identity: the live Letterboxd `More at TMDB` link for Reconstructing Faith resolves to **https://www.themoviedb.org/movie/634323/**. The override pins634323, permits missing IMDb only for this reviewed identity, constrains runtime70–90 and verifies Wen Hai/Huang Wenhai variants. Primary identity anchors remain ASAC and Chinese Independent Film Archive. Anabazys explicitly sets authoritative_runtime140, with a retained version_note explaining the provider100-minute discrepancy.
