-- DROP TABLE IF EXISTS groups;

-- CREATE TABLE groups (
--   id                    serial PRIMARY KEY,
--   name                  VARCHAR(1) UNIQUE NOT NULL
-- );

INSERT INTO groups (name)
      SELECT 'A'
UNION SELECT 'B'
UNION SELECT 'C'
UNION SELECT 'D'
UNION SELECT 'E'
UNION SELECT 'F'
UNION SELECT 'G'
UNION SELECT 'H'
ON CONFLICT (name) DO
UPDATE
   SET name = EXCLUDED.name
;
