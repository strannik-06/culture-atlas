# Culture Atlas repository guidance

Culture Atlas is a static GitHub Pages site for films, TV series and books. Supabase provides the shared catalogue, authentication and private account data. See [the product specification](docs/spec.md) for expected behavior and [the README](README.md) for service and runbook links.

- For new work, start from current `main`. For PR follow-ups, verify the PR is open and use its current head. Work on a branch and leave merging to the owner.
- Preserve canonical work IDs, provider links and existing private progress. Keep catalogue and award metadata public and account activity owner-only. Resolve identity conflicts before adding entries.
- Run `npm ci` to install test dependencies. Use the relevant checks in `.github/workflows/` as the reference for CI coverage. `npm test` runs the book and import smoke tests. `node --test tests/*.test.mjs` runs the JavaScript integration suite.
- When changing generated data, use the repository generator and include the source and generated outputs together. For catalogue changes, check `node scripts/validate-work-catalog.mjs` and the generated catalogue seed. For award changes, use [the awards runbook](docs/awards-maintenance.md).
- Use test fixtures or a disposable database for development. Keep credentials and private exports out of Git. Apply production database changes or deploy Edge Functions only when the owner authorizes that specific operation.
- Include verification results and any post-merge steps in the PR. Use [the deployment checklist](docs/deployment.md) to identify what needs to ship.
