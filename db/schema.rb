# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160907030309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", id: :integer, force: :cascade do |t|
    t.text   "name"
    t.string "slug"
    t.index ["slug"], name: "index_countries_on_slug", using: :btree
  end

  create_table "leagues", id: :integer, force: :cascade do |t|
    t.bigint "country_id"
    t.text   "name"
    t.string "slug"
    t.index ["slug"], name: "index_leagues_on_slug", using: :btree
  end

  create_table "matches", id: :bigint, force: :cascade do |t|
    t.bigint  "country_id"
    t.bigint  "league_id"
    t.bigint  "stage"
    t.text    "date"
    t.bigint  "home_team_id"
    t.bigint  "away_team_id"
    t.bigint  "home_team_goal"
    t.bigint  "away_team_goal"
    t.text    "goal"
    t.text    "shoton"
    t.text    "shotoff"
    t.text    "foulcommit"
    t.text    "card"
    t.text    "cross"
    t.text    "corner"
    t.text    "possession"
    t.decimal "b365h"
    t.decimal "b365d"
    t.decimal "b365a"
    t.decimal "bwh"
    t.decimal "bwd"
    t.decimal "bwa"
    t.decimal "iwh"
    t.decimal "iwd"
    t.decimal "iwa"
    t.decimal "lbh"
    t.decimal "lbd"
    t.decimal "lba"
    t.decimal "psh"
    t.decimal "psd"
    t.decimal "psa"
    t.decimal "whh"
    t.decimal "whd"
    t.decimal "wha"
    t.decimal "sjh"
    t.decimal "sjd"
    t.decimal "sja"
    t.decimal "vch"
    t.decimal "vcd"
    t.decimal "vca"
    t.decimal "gbh"
    t.decimal "gbd"
    t.decimal "gba"
    t.decimal "bsh"
    t.decimal "bsd"
    t.decimal "bsa"
    t.integer "season_id"
  end

  create_table "matches_away_players", primary_key: ["match_id", "player_id"], force: :cascade do |t|
    t.bigint "match_id",  null: false
    t.bigint "player_id", null: false
    t.bigint "x"
    t.bigint "y"
  end

  create_table "matches_home_players", primary_key: ["match_id", "player_id"], force: :cascade do |t|
    t.bigint "match_id",  null: false
    t.bigint "player_id", null: false
    t.bigint "x"
    t.bigint "y"
  end

  create_table "player_stats", id: :integer, force: :cascade do |t|
    t.bigint "player_fifa_api_id"
    t.bigint "player_id"
    t.text   "date_stat"
    t.bigint "overall_rating"
    t.bigint "potential"
    t.text   "preferred_foot"
    t.text   "attacking_work_rate"
    t.text   "defensive_work_rate"
    t.bigint "crossing"
    t.bigint "finishing"
    t.bigint "heading_accuracy"
    t.bigint "short_passing"
    t.bigint "volleys"
    t.bigint "dribbling"
    t.bigint "curve"
    t.bigint "free_kick_accuracy"
    t.bigint "long_passing"
    t.bigint "ball_control"
    t.bigint "acceleration"
    t.bigint "sprint_speed"
    t.bigint "agility"
    t.bigint "reactions"
    t.bigint "balance"
    t.bigint "shot_power"
    t.bigint "jumping"
    t.bigint "stamina"
    t.bigint "strength"
    t.bigint "long_shots"
    t.bigint "aggression"
    t.bigint "interceptions"
    t.bigint "positioning"
    t.bigint "vision"
    t.bigint "penalties"
    t.bigint "marking"
    t.bigint "standing_tackle"
    t.bigint "sliding_tackle"
    t.bigint "gk_diving"
    t.bigint "gk_handling"
    t.bigint "gk_kicking"
    t.bigint "gk_positioning"
    t.bigint "gk_reflexes"
    t.index ["player_id", "player_fifa_api_id", "date_stat"], name: "idx_twocols", unique: true, using: :btree
  end

  create_table "players", id: :bigint, force: :cascade do |t|
    t.text   "name"
    t.bigint "player_fifa_api_id"
    t.text   "birthday"
    t.float  "height"
    t.bigint "weight"
  end

  create_table "seasons", id: :bigint, force: :cascade do |t|
    t.text   "name"
    t.string "slug"
    t.index ["slug"], name: "index_seasons_on_slug", using: :btree
  end

  create_table "teams", id: :bigint, force: :cascade do |t|
    t.text    "name"
    t.text    "short_name"
    t.integer "league_id"
    t.index ["league_id"], name: "index_teams_on_league_id", using: :btree
    t.index ["short_name"], name: "index_teams_on_short_name", using: :btree
  end

  add_foreign_key "leagues", "countries", name: "league_country_fk"
  add_foreign_key "matches", "countries", name: "match_country_fk"
  add_foreign_key "matches", "leagues", name: "match_league_fk"
  add_foreign_key "matches", "seasons", name: "match_season_fk"
  add_foreign_key "matches", "teams", column: "away_team_id", name: "match_away_team_fk"
  add_foreign_key "matches", "teams", column: "home_team_id", name: "match_home_team_fk"
  add_foreign_key "matches_away_players", "matches", name: "match_away_match_fk"
  add_foreign_key "matches_away_players", "players", name: "match_away_player_fk"
  add_foreign_key "matches_home_players", "matches", name: "match_home_match_fk"
  add_foreign_key "matches_home_players", "players", name: "match_home_player_fk"
  add_foreign_key "player_stats", "players", name: "player_stats_player_fk"
  add_foreign_key "teams", "leagues"
end
