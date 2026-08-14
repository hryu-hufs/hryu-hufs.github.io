create type public.user_role as enum ('member', 'admin');
create table public.profiles (id uuid primary key references auth.users(id) on delete cascade,username text unique not null check(username ~ '^[a-z0-9._-]+$'),full_name text not null,role public.user_role not null default 'member',active boolean not null default true,created_at timestamptz not null default now());
alter table public.profiles enable row level security;
create policy "members read active profiles" on public.profiles for select to authenticated using(active=true);
create policy "users read own profile" on public.profiles for select to authenticated using(id=auth.uid());
-- 최초 관리자는 Dashboard의 Authentication에서 만든 후 다음 형식으로 등록합니다.
-- insert into public.profiles(id,username,full_name,role) values('AUTH_USER_UUID','admin','Administrator','admin');
