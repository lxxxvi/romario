-- DROP TABLE IF EXISTS predictions;

-- CREATE TABLE predictions (
--   id                        serial PRIMARY KEY,
--   match_id                  VARCHAR(100) UNIQUE NOT NULL
--   predicted_left_team_score
--   predicted_right_team_score
--   points_left_team_score
--   points_right_team_score
--   points_overall_outcome
--   points_goal_difference
-- );

INSERT INTO predictions (match_id, user_id, predicted_left_team_score, predicted_right_team_score, created_at, updated_at)
      SELECT matches.id, users.id, 0, 0, now(), now() FROM matches CROSS JOIN users
ON CONFLICT (user_id, match_id) DO
UPDATE
   SET predicted_left_team_score  = EXCLUDED.predicted_left_team_score
     , predicted_right_team_score = EXCLUDED.predicted_right_team_score
     , updated_at                 = EXCLUDED.updated_at
;
