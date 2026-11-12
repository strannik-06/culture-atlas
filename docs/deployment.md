# Deployment checklist

Record the applicable steps in the PR before merge. Verify the deployed result or record pending work in the PR after merge. A dated deployment audit is historical evidence. Confirm any later changes through their PRs, workflow runs, or the live service.

| Change | Verification and release |
| --- | --- |
| Frontend or public assets | Run the affected checks and any generator consistency checks. After merge, use the [Actions dashboard](https://github.com/strannik-06/culture-atlas/actions) to verify Pages publication and check the affected live route. |
| Schema, RPC, or access policy | Test the change with fixtures, including affected permissions. Identify the exact checked-in SQL and its dependencies in the PR. After merge and owner authorization, apply it to the intended Supabase project and verify the affected behavior. |
| New catalogue identities | Regenerate the catalogue seed when the static media catalogue changes. Identify the scoped registration SQL, if needed, and verify canonical keys and conflicts. After merge and owner authorization, apply the reviewed insert-only registration and confirm that its public entries resolve. |
| Media search Edge Function | Review the function and its validation checks. After merge and owner authorization, run [Deploy media search](https://github.com/strannik-06/culture-atlas/actions/workflows/deploy-media-search.yml). Verify public search and the expected sign-in boundary for saving. |
| Backup or recovery | Follow the [backup and recovery runbook](media-search-and-backups.md). Use [Weekly encrypted backup](https://github.com/strannik-06/culture-atlas/actions/workflows/weekly-backup.yml) to confirm the latest run and its verification result. |
