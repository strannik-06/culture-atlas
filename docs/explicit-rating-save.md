# Explicit rating save and TV shortcuts

Star popups now keep a selected value separate from the saved value. Save appears at the lower right after a change; selecting stars or Clear does not save or close the popup. Escape/outside dismissal discards the selection. Keyboard users select a value, then activate Save.

TV series-card stars and season buttons in Details open a compact quick-rating popup, without opening the editor. Save targets that exact series/season work key. Existing notes, scope, watched date and optimistic-concurrency version are captured when opening the popup and preserved in the rating RPC. Failures retain the selected value and display the error. Account changes clear the popup. Full editing remains accessible through Edit in Details.

Star pickers inside full film/book/TV editors accept their selected value into that form through the popup Save; saving the complete form remains explicit. This preserves draft semantics for notes and dates.

Regression coverage checks explicit save/dismissal, half-point and keyboard ratings, independent series/season targets, private metadata/version preservation, and existing editor saves. Browser QA uses a mocked account; it does not write to the live database.

No schema changes, SQL or catalogue registrations are required.
