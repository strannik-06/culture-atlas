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
