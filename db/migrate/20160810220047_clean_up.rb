class CleanUp < ActiveRecord::Migration
  def change
    execute <<-SQL
ALTER TABLE country RENAME TO countries;
ALTER TABLE countries ADD PRIMARY KEY (id);

ALTER TABLE league RENAME TO leagues;
ALTER TABLE leagues ADD PRIMARY KEY (id);

ALTER TABLE match RENAME TO matches;
ALTER TABLE matches DROP COLUMN id;
ALTER TABLE matches RENAME COLUMN match_api_id TO id;
ALTER TABLE matches ADD PRIMARY KEY (id);
ALTER TABLE matches RENAME COLUMN home_team_api_id TO home_team_id;
ALTER TABLE matches RENAME COLUMN away_team_api_id TO away_team_id;

ALTER TABLE player RENAME TO players;
ALTER TABLE players DROP COLUMN id;
ALTER TABLE players RENAME COLUMN player_api_id to id;
ALTER TABLE players ADD PRIMARY KEY (id);

ALTER TABLE player_stats RENAME COLUMN player_api_id TO player_id;
ALTER TABLE player_stats ADD PRIMARY KEY (id);

ALTER TABLE team RENAME TO teams;
ALTER TABLE teams DROP COLUMN id;
ALTER TABLE teams RENAME COLUMN team_api_id TO id;
ALTER TABLE teams RENAME COLUMN team_long_name TO name;
ALTER TABLE teams RENAME COLUMN team_short_name TO short_name;
ALTER TABLE teams ADD PRIMARY KEY (id);

WITH mhp AS (
  SELECT
    id             AS match_id,
    home_player_1  AS player_id,
    home_player_x1 AS x,
    home_player_y1 AS y
  FROM matches
  WHERE home_player_1 IS NOT NULL
  UNION
  SELECT
    id             AS match_id,
    home_player_2  AS player_id,
    home_player_x2 AS x,
    home_player_y2 AS y
  FROM matches
  WHERE home_player_2 IS NOT NULL
  UNION
  SELECT
    id             AS match_id,
    home_player_3  AS player_id,
    home_player_x3 AS x,
    home_player_y3 AS y
  FROM matches
  WHERE home_player_3 IS NOT NULL
  UNION
  SELECT
    id             AS match_id,
    home_player_4  AS player_id,
    home_player_x4 AS x,
    home_player_y4 AS y
  FROM matches
  WHERE home_player_4 IS NOT NULL
  UNION
  SELECT
    id             AS match_id,
    home_player_5  AS player_id,
    home_player_x5 AS x,
    home_player_y5 AS y
  FROM matches
  WHERE home_player_5 IS NOT NULL
  UNION
  SELECT
    id             AS match_id,
    home_player_6  AS player_id,
    home_player_x6 AS x,
    home_player_y6 AS y
  FROM matches
  WHERE home_player_6 IS NOT NULL
  UNION
  SELECT
    id             AS match_id,
    home_player_7  AS player_id,
    home_player_x7 AS x,
    home_player_y7 AS y
  FROM matches
  WHERE home_player_7 IS NOT NULL
  UNION
  SELECT
    id             AS match_id,
    home_player_8  AS player_id,
    home_player_x8 AS x,
    home_player_y8 AS y
  FROM matches
  WHERE home_player_8 IS NOT NULL
  UNION
  SELECT
    id             AS match_id,
    home_player_9  AS player_id,
    home_player_x9 AS x,
    home_player_y9 AS y
  FROM matches
  WHERE home_player_9 IS NOT NULL
  UNION
  SELECT
    id              AS match_id,
    home_player_10  AS player_id,
    home_player_x10 AS x,
    home_player_y10 AS y
  FROM matches
  WHERE home_player_10 IS NOT NULL
  UNION
  SELECT
    id              AS match_id,
    home_player_11  AS player_id,
    home_player_x11 AS x,
    home_player_y11 AS y
  FROM matches
  WHERE home_player_11 IS NOT NULL
)
SELECT DISTINCT ON (match_id, player_id) *
INTO matches_home_players
FROM mhp;
ALTER TABLE matches_home_players ADD PRIMARY KEY (match_id, player_id);

WITH map AS (
  SELECT
    id             AS match_id,
    away_player_1  AS player_id,
    away_player_x1 AS x,
    away_player_y1 AS y
  FROM matches
  WHERE away_player_1 IS NOT NULL
  UNION
  SELECT
    id             AS match_id,
    away_player_2  AS player_id,
    away_player_x2 AS x,
    away_player_y2 AS y
  FROM matches
  WHERE away_player_2 IS NOT NULL
  UNION
  SELECT
    id             AS match_id,
    away_player_3  AS player_id,
    away_player_x3 AS x,
    away_player_y3 AS y
  FROM matches
  WHERE away_player_3 IS NOT NULL
  UNION
  SELECT
    id             AS match_id,
    away_player_4  AS player_id,
    away_player_x4 AS x,
    away_player_y4 AS y
  FROM matches
  WHERE away_player_4 IS NOT NULL
  UNION
  SELECT
    id             AS match_id,
    away_player_5  AS player_id,
    away_player_x5 AS x,
    away_player_y5 AS y
  FROM matches
  WHERE away_player_5 IS NOT NULL
  UNION
  SELECT
    id             AS match_id,
    away_player_6  AS player_id,
    away_player_x6 AS x,
    away_player_y6 AS y
  FROM matches
  WHERE away_player_6 IS NOT NULL
  UNION
  SELECT
    id             AS match_id,
    away_player_7  AS player_id,
    away_player_x7 AS x,
    away_player_y7 AS y
  FROM matches
  WHERE away_player_7 IS NOT NULL
  UNION
  SELECT
    id             AS match_id,
    away_player_8  AS player_id,
    away_player_x8 AS x,
    away_player_y8 AS y
  FROM matches
  WHERE away_player_8 IS NOT NULL
  UNION
  SELECT
    id             AS match_id,
    away_player_9  AS player_id,
    away_player_x9 AS x,
    away_player_y9 AS y
  FROM matches
  WHERE away_player_9 IS NOT NULL
  UNION
  SELECT
    id              AS match_id,
    away_player_10  AS player_id,
    away_player_x10 AS x,
    away_player_y10 AS y
  FROM matches
  WHERE away_player_10 IS NOT NULL
  UNION
  SELECT
    id              AS match_id,
    away_player_11  AS player_id,
    away_player_x11 AS x,
    away_player_y11 AS y
  FROM matches
  WHERE away_player_11 IS NOT NULL
)
SELECT DISTINCT ON (match_id, player_id) *
INTO matches_away_players
FROM map;
ALTER TABLE matches_away_players ADD PRIMARY KEY (match_id, player_id);

ALTER TABLE matches DROP COLUMN home_player_1;
ALTER TABLE matches DROP COLUMN home_player_2;
ALTER TABLE matches DROP COLUMN home_player_3;
ALTER TABLE matches DROP COLUMN home_player_4;
ALTER TABLE matches DROP COLUMN home_player_5;
ALTER TABLE matches DROP COLUMN home_player_6;
ALTER TABLE matches DROP COLUMN home_player_7;
ALTER TABLE matches DROP COLUMN home_player_8;
ALTER TABLE matches DROP COLUMN home_player_9;
ALTER TABLE matches DROP COLUMN home_player_10;
ALTER TABLE matches DROP COLUMN home_player_11;
ALTER TABLE matches DROP COLUMN home_player_x1;
ALTER TABLE matches DROP COLUMN home_player_x2;
ALTER TABLE matches DROP COLUMN home_player_x3;
ALTER TABLE matches DROP COLUMN home_player_x4;
ALTER TABLE matches DROP COLUMN home_player_x5;
ALTER TABLE matches DROP COLUMN home_player_x6;
ALTER TABLE matches DROP COLUMN home_player_x7;
ALTER TABLE matches DROP COLUMN home_player_x8;
ALTER TABLE matches DROP COLUMN home_player_x9;
ALTER TABLE matches DROP COLUMN home_player_x10;
ALTER TABLE matches DROP COLUMN home_player_x11;
ALTER TABLE matches DROP COLUMN home_player_y1;
ALTER TABLE matches DROP COLUMN home_player_y2;
ALTER TABLE matches DROP COLUMN home_player_y3;
ALTER TABLE matches DROP COLUMN home_player_y4;
ALTER TABLE matches DROP COLUMN home_player_y5;
ALTER TABLE matches DROP COLUMN home_player_y6;
ALTER TABLE matches DROP COLUMN home_player_y7;
ALTER TABLE matches DROP COLUMN home_player_y8;
ALTER TABLE matches DROP COLUMN home_player_y9;
ALTER TABLE matches DROP COLUMN home_player_y10;
ALTER TABLE matches DROP COLUMN home_player_y11;

ALTER TABLE matches DROP COLUMN away_player_1;
ALTER TABLE matches DROP COLUMN away_player_2;
ALTER TABLE matches DROP COLUMN away_player_3;
ALTER TABLE matches DROP COLUMN away_player_4;
ALTER TABLE matches DROP COLUMN away_player_5;
ALTER TABLE matches DROP COLUMN away_player_6;
ALTER TABLE matches DROP COLUMN away_player_7;
ALTER TABLE matches DROP COLUMN away_player_8;
ALTER TABLE matches DROP COLUMN away_player_9;
ALTER TABLE matches DROP COLUMN away_player_10;
ALTER TABLE matches DROP COLUMN away_player_11;
ALTER TABLE matches DROP COLUMN away_player_x1;
ALTER TABLE matches DROP COLUMN away_player_x2;
ALTER TABLE matches DROP COLUMN away_player_x3;
ALTER TABLE matches DROP COLUMN away_player_x4;
ALTER TABLE matches DROP COLUMN away_player_x5;
ALTER TABLE matches DROP COLUMN away_player_x6;
ALTER TABLE matches DROP COLUMN away_player_x7;
ALTER TABLE matches DROP COLUMN away_player_x8;
ALTER TABLE matches DROP COLUMN away_player_x9;
ALTER TABLE matches DROP COLUMN away_player_x10;
ALTER TABLE matches DROP COLUMN away_player_x11;
ALTER TABLE matches DROP COLUMN away_player_y1;
ALTER TABLE matches DROP COLUMN away_player_y2;
ALTER TABLE matches DROP COLUMN away_player_y3;
ALTER TABLE matches DROP COLUMN away_player_y4;
ALTER TABLE matches DROP COLUMN away_player_y5;
ALTER TABLE matches DROP COLUMN away_player_y6;
ALTER TABLE matches DROP COLUMN away_player_y7;
ALTER TABLE matches DROP COLUMN away_player_y8;
ALTER TABLE matches DROP COLUMN away_player_y9;
ALTER TABLE matches DROP COLUMN away_player_y10;
ALTER TABLE matches DROP COLUMN away_player_y11;

WITH s AS (SELECT DISTINCT season AS name FROM matches)
SELECT row_number() OVER (ORDER BY name ASC) AS id, name INTO seasons FROM s;
ALTER TABLE seasons ADD PRIMARY KEY (id);
ALTER TABLE matches ADD COLUMN season_id INTEGER;
UPDATE matches SET season_id = (SELECT seasons.id FROM seasons WHERE matches.season = seasons.name);
ALTER TABLE matches DROP COLUMN season;

ALTER TABLE leagues ADD CONSTRAINT league_country_fk FOREIGN KEY (country_id) REFERENCES countries (id);
ALTER TABLE matches ADD CONSTRAINT match_country_fk FOREIGN KEY (country_id) REFERENCES countries (id);
ALTER TABLE matches ADD CONSTRAINT match_league_fk FOREIGN KEY (league_id) REFERENCES leagues (id);
ALTER TABLE matches ADD CONSTRAINT match_home_team_fk FOREIGN KEY (home_team_id) REFERENCES teams (id);
ALTER TABLE matches ADD CONSTRAINT match_away_team_fk FOREIGN KEY (away_team_id) REFERENCES teams (id);
ALTER TABLE matches ADD CONSTRAINT match_season_fk FOREIGN KEY (season_id) REFERENCES seasons (id);
ALTER TABLE matches_home_players ADD CONSTRAINT match_home_match_fk FOREIGN KEY (match_id) REFERENCES matches (id);
ALTER TABLE matches_home_players ADD CONSTRAINT match_home_player_fk FOREIGN KEY (player_id) REFERENCES players (id);
ALTER TABLE matches_away_players ADD CONSTRAINT match_away_match_fk FOREIGN KEY (match_id) REFERENCES matches (id);
ALTER TABLE matches_away_players ADD CONSTRAINT match_away_player_fk FOREIGN KEY (player_id) REFERENCES players (id);
ALTER TABLE player_stats ADD CONSTRAINT player_stats_player_fk FOREIGN KEY (player_id) REFERENCES players (id);
    SQL
  end
end
