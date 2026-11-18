create table if not exists public.game_results (
  id bigint generated always as identity primary key,
  student_name text not null check (char_length(student_name) between 1 and 60),
  student_group text,
  score integer not null check (score between 0 and 180),
  hits integer not null check (hits between 0 and 15),
  total_questions integer not null default 15 check (total_questions = 15),
  elapsed_seconds integer not null check (elapsed_seconds >= 0),
  bonus_points integer not null default 0 check (bonus_points between 0 and 30),
  answers jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now()
);
alter table public.game_results enable row level security;
create policy "students can submit results" on public.game_results
for insert to anon, authenticated
with check (char_length(student_name) between 1 and 60 and score between 0 and 180 and hits between 0 and 15 and total_questions = 15 and elapsed_seconds >= 0 and bonus_points between 0 and 30);
create policy "teachers can read results" on public.game_results
for select to authenticated using (true);
