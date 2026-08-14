# MMMI Internal setup

The public UI is hosted at `/internal/`. Authentication and admin-only user creation require Supabase.

1. Create a Supabase project and run `supabase/schema.sql` in SQL Editor.
2. Create the first user in Authentication with email `admin@mmmi.internal` and a strong password.
3. Copy that user's UUID into the commented administrator insert at the bottom of `schema.sql` and run the insert.
4. Deploy `supabase/functions/create-user` as the `create-user` Edge Function with JWT verification enabled.
5. Put the project URL and publishable/anon key in `internal/config.js`. The anon key is designed for browser use; never put the service-role key in this repository.

All later accounts must be created from **User management** by an authenticated administrator.
