-- DROP TABLE IF EXISTS matches;

-- CREATE TABLE matches (
--   id                  serial        PRIMARY KEY,
--   venue_id            INTEGER,
--   phase               VARCHAR(100)  NOT NULL,
--   left_country_id     INTEGER,
--   right_country_id    INTEGER,
--   left_final_score    INTEGER,
--   right_final_score   INTEGER,
--   kickoff_at          TIME          NOT NULL,
--   comments            TEXT
-- );

-- ALTER TABLE matches ADD CONSTRAINT match_venue_id_fk FOREIGN KEY (venue_id) REFERENCES venues (id);
-- ALTER TABLE matches ADD CONSTRAINT match_left_country_id_fk  FOREIGN KEY (left_country_id)  REFERENCES countries (id);
-- ALTER TABLE matches ADD CONSTRAINT match_right_country_id_fk FOREIGN KEY (right_country_id) REFERENCES countries (id);
-- ALTER TABLE matches ADD CONSTRAINT uniqe_match_phase_ak UNIQUE (phase, left_country_id, right_country_id);

INSERT INTO matches (
    venue_id
  , phase
  , left_country_id
  , right_country_id
  , kickoff_at
)
SELECT venue.id                   AS venue_id
     , 'Group stage'::text        AS phase
     , left_country.id            AS left_country_id
     , right_country.id           AS right_country_id
     , match.kickoff_at           AS kickoff_at
  FROM (
        SELECT 'sweetly.detained.venues'::text                      AS venue
             , 'RUS'::text                                          AS left_country_code
             , 'KSA'::text                                          AS right_country_code
             , TIMESTAMP WITH TIME ZONE '2018-06-14 15:00:00+00'    AS kickoff_at

  UNION SELECT 'binders.earl.area'::text                            AS venue
             , 'EGY'::text                                          AS left_country_code
             , 'URU'::text                                          AS right_country_code
             , TIMESTAMP WITH TIME ZONE '2018-06-15 12:00:00+00'    AS kickoff_at

  UNION SELECT 'caravan.revives.jigging'::text                      AS venue
             , 'MOR'::text                                          AS left_country_code
             , 'IRN'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-15 15:00:00+00'   AS kickoff_at

  UNION SELECT 'bandaging.flustered.minutiae'::text                 AS venue
             , 'POR'::text                                          AS left_country_code
             , 'ESP'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-15 18:00:00+00'   AS kickoff_at

  UNION SELECT 'ecover.news.deeply'::text                           AS venue
             , 'FRA'::text                                          AS left_country_code
             , 'AUS'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-16 10:00:00+00'   AS kickoff_at

  UNION SELECT 'slap.flicks.late'::text                             AS venue
             , 'ARG'::text                                          AS left_country_code
             , 'ISL'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-16 13:00:00+00'   AS kickoff_at

  UNION SELECT 'blinks.corn.commands'::text                         AS venue
             , 'PER'::text                                          AS left_country_code
             , 'DEN'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-16 16:00:00+00'   AS kickoff_at

  UNION SELECT 'slick.texted.star'::text                            AS venue
             , 'CRO'::text                                          AS left_country_code
             , 'NGA'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-16 19:00:00+00'   AS kickoff_at

  UNION SELECT 'cats.sweeper.struck'::text                          AS venue
             , 'CRC'::text                                          AS left_country_code
             , 'SRB'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-17 12:00:00+00'   AS kickoff_at

  UNION SELECT 'sweetly.detained.venues'::text                      AS venue
             , 'GER'::text                                          AS left_country_code
             , 'MEX'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-17 15:00:00+00'   AS kickoff_at

  UNION SELECT 'tempting.prude.natively'::text                      AS venue
             , 'BRA'::text                                          AS left_country_code
             , 'SUI'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-17 18:00:00+00'   AS kickoff_at

  UNION SELECT 'years.burying.fewest'::text                         AS venue
             , 'SWE'::text                                          AS left_country_code
             , 'KOR'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-18 12:00:00+00'   AS kickoff_at

  UNION SELECT 'bandaging.flustered.minutiae'::text                 AS venue
             , 'BEL'::text                                          AS left_country_code
             , 'PAN'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-18 15:00:00+00'   AS kickoff_at

  UNION SELECT 'humidity.recoup.cookery'::text                      AS venue
             , 'TUN'::text                                          AS left_country_code
             , 'ENG'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-18 20:00:00+00'   AS kickoff_at

  UNION SELECT 'blinks.corn.commands'::text                         AS venue
             , 'COL'::text                                          AS left_country_code
             , 'JPN'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-19 12:00:00+00'   AS kickoff_at

  UNION SELECT 'slap.flicks.late'::text                             AS venue
             , 'POL'::text                                          AS left_country_code
             , 'SEN'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-19 15:00:00+00'   AS kickoff_at

  UNION SELECT 'caravan.revives.jigging'::text                      AS venue
             , 'RUS'::text                                          AS left_country_code
             , 'EGY'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-19 18:00:00+00'   AS kickoff_at

  UNION SELECT 'sweetly.detained.venues'::text                      AS venue
             , 'POR'::text                                          AS left_country_code
             , 'MOR'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-20 12:00:00+00'   AS kickoff_at

  UNION SELECT 'tempting.prude.natively'::text                      AS venue
             , 'URU'::text                                          AS left_country_code
             , 'KSA'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-20 15:00:00+00'   AS kickoff_at

  UNION SELECT 'recover.news.deeply'::text                          AS venue
             , 'IRN'::text                                          AS left_country_code
             , 'ESP'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-20 18:00:00+00'   AS kickoff_at

  UNION SELECT 'cats.sweeper.struck'::text                          AS venue
             , 'DEN'::text                                          AS left_country_code
             , 'AUS'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-21 12:00:00+00'   AS kickoff_at

  UNION SELECT 'binders.earl.area'::text                            AS venue
             , 'FRA'::text                                          AS left_country_code
             , 'PER'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-21 15:00:00+00'   AS kickoff_at

  UNION SELECT 'years.burying.fewest'::text                         AS venue
             , 'ARG'::text                                          AS left_country_code
             , 'CRO'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-21 18:00:00+00'   AS kickoff_at

  UNION SELECT 'caravan.revives.jigging'::text                      AS venue
             , 'BRA'::text                                          AS left_country_code
             , 'CRC'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-22 12:00:00+00'   AS kickoff_at

  UNION SELECT 'humidity.recoup.cookery'::text                      AS venue
             , 'NGA'::text                                          AS left_country_code
             , 'ISL'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-22 15:00:00+00'   AS kickoff_at

  UNION SELECT 'slick.texted.star'::text                            AS venue
             , 'SRB'::text                                          AS left_country_code
             , 'SUI'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-22 18:00:00+00'   AS kickoff_at

  UNION SELECT 'slap.flicks.late'::text                             AS venue
             , 'BEL'::text                                          AS left_country_code
             , 'TUN'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-23 12:00:00+00'   AS kickoff_at

  UNION SELECT 'tempting.prude.natively'::text                      AS venue
             , 'KOR'::text                                          AS left_country_code
             , 'MEX'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-23 15:00:00+00'   AS kickoff_at

  UNION SELECT 'bandaging.flustered.minutiae'::text                 AS venue
             , 'GER'::text                                          AS left_country_code
             , 'SWE'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-23 18:00:00+00'   AS kickoff_at

  UNION SELECT 'years.burying.fewest'::text                         AS venue
             , 'ENG'::text                                          AS left_country_code
             , 'PAN'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-24 12:00:00+00'   AS kickoff_at

  UNION SELECT 'binders.earl.area'::text                            AS venue
             , 'JPN'::text                                          AS left_country_code
             , 'SEN'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-24 15:00:00+00'   AS kickoff_at

  UNION SELECT 'recover.news.deeply'::text                          AS venue
             , 'POL'::text                                          AS left_country_code
             , 'COL'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-24 18:00:00+00'   AS kickoff_at

  UNION SELECT 'cats.sweeper.struck'::text                          AS venue
             , 'URU'::text                                          AS left_country_code
             , 'RUS'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-25 14:00:00+00'   AS kickoff_at

  UNION SELECT 'humidity.recoup.cookery'::text                      AS venue
             , 'KSA'::text                                          AS left_country_code
             , 'EGY'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-25 14:00:00+00'   AS kickoff_at

  UNION SELECT 'blinks.corn.commands'::text                         AS venue
             , 'IRN'::text                                          AS left_country_code
             , 'POR'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-25 18:00:00+00'   AS kickoff_at

  UNION SELECT 'slick.texted.star'::text                            AS venue
             , 'ESP'::text                                          AS left_country_code
             , 'MOR'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-25 18:00:00+00'   AS kickoff_at

  UNION SELECT 'sweetly.detained.venues'::text                      AS venue
             , 'DEN'::text                                          AS left_country_code
             , 'FRA'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-26 14:00:00+00'   AS kickoff_at

  UNION SELECT 'bandaging.flustered.minutiae'::text                 AS venue
             , 'AUS'::text                                          AS left_country_code
             , 'PER'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-26 14:00:00+00'   AS kickoff_at

  UNION SELECT 'caravan.revives.jigging'::text                      AS venue
             , 'NGA'::text                                          AS left_country_code
             , 'ARG'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-26 18:00:00+00'   AS kickoff_at

  UNION SELECT 'tempting.prude.natively'::text                      AS venue
             , 'ISL'::text                                          AS left_country_code
             , 'CRO'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-26 18:00:00+00'   AS kickoff_at

  UNION SELECT 'binders.earl.area'::text                            AS venue
             , 'MEX'::text                                          AS left_country_code
             , 'SWE'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-27 14:00:00+00'   AS kickoff_at

  UNION SELECT 'recover.news.deeply'::text                          AS venue
             , 'KOR'::text                                          AS left_country_code
             , 'GER'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-27 14:00:00+00'   AS kickoff_at

  UNION SELECT 'slap.flicks.late'::text                             AS venue
             , 'SRB'::text                                          AS left_country_code
             , 'BRA'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-27 18:00:00+00'   AS kickoff_at

  UNION SELECT 'years.burying.fewest'::text                         AS venue
             , 'SUI'::text                                          AS left_country_code
             , 'CRC'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-27 18:00:00+00'   AS kickoff_at

  UNION SELECT 'humidity.recoup.cookery'::text                      AS venue
             , 'JPN'::text                                          AS left_country_code
             , 'POL'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-28 14:00:00+00'   AS kickoff_at

  UNION SELECT 'cats.sweeper.struck'::text                          AS venue
             , 'SEN'::text                                          AS left_country_code
             , 'COL'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-28 14:00:00+00'   AS kickoff_at

  UNION SELECT 'blinks.corn.commands'::text                         AS venue
             , 'PAN'::text                                          AS left_country_code
             , 'TUN'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-28 18:00:00+00'   AS kickoff_at

  UNION SELECT 'slick.texted.star'::text                            AS venue
             , 'ENG'::text                                          AS left_country_code
             , 'BEL'::text                                          AS right_country_code
             ,  TIMESTAMP WITH TIME ZONE '2018-06-28 18:00:00+00'   AS kickoff_at
) match
INNER JOIN venues      venue            ON venue.what3words                = match.venue
INNER JOIN countries   left_country     ON left_country.fifa_country_code  = match.left_country_code
INNER JOIN countries   right_country    ON right_country.fifa_country_code = match.right_country_code
ON CONFLICT (phase, left_country_id, right_country_id) DO
 UPDATE
    SET venue_id       = EXCLUDED.venue_id
      , kickoff_at     = EXCLUDED.kickoff_at
;
