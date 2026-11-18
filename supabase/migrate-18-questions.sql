-- Migration for the 18-question version of Operación Modular.
-- Run once in Supabase SQL Editor after publishing the updated game.

ALTER TABLE public.game_results
  ALTER COLUMN total_questions SET DEFAULT 18;

ALTER TABLE public.game_results
  DROP CONSTRAINT IF EXISTS game_results_score_check,
  DROP CONSTRAINT IF EXISTS game_results_hits_check,
  DROP CONSTRAINT IF EXISTS game_results_total_questions_check,
  DROP CONSTRAINT IF EXISTS game_results_bonus_points_check;

ALTER TABLE public.game_results
  ADD CONSTRAINT game_results_score_check CHECK (score BETWEEN 0 AND 216),
  ADD CONSTRAINT game_results_hits_check CHECK (hits BETWEEN 0 AND 18),
  ADD CONSTRAINT game_results_total_questions_check CHECK (total_questions = 18),
  ADD CONSTRAINT game_results_bonus_points_check CHECK (bonus_points BETWEEN 0 AND 36);

DROP POLICY IF EXISTS "students can submit results" ON public.game_results;

CREATE POLICY "students can submit results"
ON public.game_results
FOR INSERT TO anon, authenticated
WITH CHECK (
  char_length(student_name) BETWEEN 1 AND 60
  AND score BETWEEN 0 AND 216
  AND hits BETWEEN 0 AND 18
  AND total_questions = 18
  AND elapsed_seconds >= 0
  AND bonus_points BETWEEN 0 AND 36
);
