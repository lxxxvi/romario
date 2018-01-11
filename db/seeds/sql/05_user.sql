-- DROP TABLE IF EXISTS users;

-- CREATE TABLE users (
--   id                        serial PRIMARY KEY,
--   email                     VARCHAR(100) UNIQUE NOT NULL
--   nickname                  VARCHAR(50) UNIQUE NOT NULL
--   created_at                TIME NOT NULL
--   updated_at                TIME NOT NULL
-- );

INSERT INTO users (email, nickname, created_at, updated_at)
      SELECT 'a@b.com', 'foo', now(), now()
ON CONFLICT (email) DO
UPDATE
   SET nickname   = EXCLUDED.nickname
     , updated_at = EXCLUDED.updated_at
;
