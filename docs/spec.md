# Culture Atlas product specification

Culture Atlas helps people explore films, TV series and books and keep a private record of what they watched, read, or want to get to next.

| Area | Expected behavior |
| --- | --- |
| Public browsing | Guests can browse the full catalogues, see award editions, search, and open details. The catalogue includes unrated works and shared entries added through discovery. |
| Account features | My ratings, watch/read lists and film statistics require sign-in. Scores, notes, watch/read dates and history, and saved lists belong to the signed-in account. Saving an item to a private list can register its public catalogue record. A rating removes a work from the corresponding saved list. It can be added again. |
| Film and TV progress | First-time ratings default to today's local date. Editing preserves the saved date unless the user changes it, including dates that are unknown. Whole-series and season ratings are separate, with their existing canonical identities and scope preserved. |
| Book progress | Submitting a rating and review also saves the reading date in reading history. A new review defaults to today. An existing month-only date is represented by the first day of that month. Preserve earlier rereads and existing dates when editing a review. |
| Layout | Cards and List are selectable in supported views and remembered per page and account. Film statistics drill-downs default to List. Use the title to open full details. TV Catalogue defaults to A–Z and includes public unrated works. TV My ratings filters to rated works. |
| Awards | Award pages are public and grouped by family and edition. Edition year identifies the ceremony or prize, which can differ from the work's release year. Show confirmed future dates as scheduled. Keep nominations when marking winners and preserve joint winners. |

GitHub Pages serves the frontend. The repository contains public data sources, generators, and generated assets. Supabase stores shared catalogue registrations and owner-only activity. Changes to public metadata should reuse canonical records across browsing, awards, and personal views.

See [private lists](private-lists.md), [TV ratings](tv-ratings.md), and [awards maintenance](awards-maintenance.md) for implementation and historical context.
