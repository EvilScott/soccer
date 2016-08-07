class AddPrimaryAndForeignKeys < ActiveRecord::Migration
  def change
    execute <<SQL
BEGIN;
  -- add PKs
  ALTER TABLE "country" ADD PRIMARY KEY (id);
  ALTER TABLE "league" ADD PRIMARY KEY (id);
  ALTER TABLE "match" ADD PRIMARY KEY (id);
  ALTER TABLE "player" ADD PRIMARY KEY (id);
  ALTER TABLE "player_stats" ADD PRIMARY KEY (id);
  ALTER TABLE "team" ADD PRIMARY KEY (id);

  -- add uniques for "api ids"
  ALTER TABLE "team" ADD CONSTRAINT team_api_id_uniq UNIQUE (team_api_id);
  ALTER TABLE "player" ADD CONSTRAINT player_api_id_uniq UNIQUE (player_api_id);

  -- add FKs
  ALTER TABLE "league" ADD CONSTRAINT league_country_fk FOREIGN KEY (country_id) REFERENCES "country" (id);
  ALTER TABLE "match" ADD CONSTRAINT match_country_fk FOREIGN KEY (country_id) REFERENCES "country" (id);
  ALTER TABLE "match" ADD CONSTRAINT match_league_fk FOREIGN KEY (league_id) REFERENCES "league" (id);
  ALTER TABLE "match" ADD CONSTRAINT match_home_team_fk FOREIGN KEY (home_team_api_id) REFERENCES "team" (team_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_away_team_fk FOREIGN KEY (away_team_api_id) REFERENCES "team" (team_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_home_player_1_player_fk FOREIGN KEY (home_player_1) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_home_player_2_player_fk FOREIGN KEY (home_player_2) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_home_player_3_player_fk FOREIGN KEY (home_player_3) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_home_player_4_player_fk FOREIGN KEY (home_player_4) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_home_player_5_player_fk FOREIGN KEY (home_player_5) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_home_player_6_player_fk FOREIGN KEY (home_player_6) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_home_player_7_player_fk FOREIGN KEY (home_player_7) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_home_player_8_player_fk FOREIGN KEY (home_player_8) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_home_player_9_player_fk FOREIGN KEY (home_player_9) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_home_player_10_player_fk FOREIGN KEY (home_player_10) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_home_player_11_player_fk FOREIGN KEY (home_player_11) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_away_player_1_player_fk FOREIGN KEY (away_player_1) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_away_player_2_player_fk FOREIGN KEY (away_player_2) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_away_player_3_player_fk FOREIGN KEY (away_player_3) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_away_player_4_player_fk FOREIGN KEY (away_player_4) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_away_player_5_player_fk FOREIGN KEY (away_player_5) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_away_player_6_player_fk FOREIGN KEY (away_player_6) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_away_player_7_player_fk FOREIGN KEY (away_player_7) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_away_player_8_player_fk FOREIGN KEY (away_player_8) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_away_player_9_player_fk FOREIGN KEY (away_player_9) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_away_player_10_player_fk FOREIGN KEY (away_player_10) REFERENCES "player" (player_api_id);
  ALTER TABLE "match" ADD CONSTRAINT match_away_player_11_player_fk FOREIGN KEY (away_player_11) REFERENCES "player" (player_api_id);
COMMIT;
SQL
  end
end
