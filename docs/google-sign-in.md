# Google sign-in setup and account safety

The website now offers **Continue with Google** alongside the existing email magic link. This UI change alone does not enable Google OAuth.

## Supabase setup (project ufqaidyshfkbymbrzdff)

1. In Google Cloud Console create a Google OAuth **Web application** client. Configure authorized redirect URI:
   `https://ufqaidyshfkbymbrzdff.supabase.co/auth/v1/callback`
2. In Supabase Dashboard → Authentication → Providers → Google, enable Google and enter the Google client ID and client secret. Do not put the client secret in the public repository.
3. In Supabase Dashboard → Authentication → URL Configuration, add the website to **Redirect URLs**:
   `https://strannik-06.github.io/culture-atlas/`
   Keep existing allowed URLs for email authentication.
4. Verify on desktop and mobile that clicking Continue with Google redirects back to the website and shows the expected signed-in email.

## Preserve existing progress

Existing film ratings are scoped to Supabase `auth.users.id`, **not email**. Google OAuth can sometimes create a different user ID from the email-link account, depending on Supabase identity linking and verified email status. Before switching the owner's primary login, sign in via the existing email link and export ratings from the account panel. Then sign in with Google and verify that the same progress appears. If it does not, **do not overwrite or delete the original account**. Restore the email login and link identities or migrate progress deliberately after checking both user IDs.

The email-link login remains as a fallback while this is tested. The OAuth callback uses the existing Supabase JS PKCE session detection. Mobile in-app browsers may still have browser isolation; test in Safari/Chrome.
