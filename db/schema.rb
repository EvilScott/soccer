# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160810220047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.text "name"
  end

  create_table "leagues", force: :cascade do |t|
    t.integer "country_id", limit: 8
    t.text    "name"
  end

  create_table "matches", id: :bigserial, force: :cascade do |t|
    t.integer "country_id",     limit: 8
    t.integer "league_id",      limit: 8
    t.integer "stage",          limit: 8
    t.text    "date"
    t.integer "home_team_id",   limit: 8
    t.integer "away_team_id",   limit: 8
    t.integer "home_team_goal", limit: 8
    t.integer "away_team_goal", limit: 8
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

  create_table "matches_away_players", id: false, force: :cascade do |t|
    t.integer "match_id",  limit: 8, null: false
    t.integer "player_id", limit: 8, null: false
    t.integer "x",         limit: 8
    t.integer "y",         limit: 8
  end

  create_table "matches_home_players", id: false, force: :cascade do |t|
    t.integer "match_id",  limit: 8, null: false
    t.integer "player_id", limit: 8, null: false
    t.integer "x",         limit: 8
    t.integer "y",         limit: 8
  end

  create_table "player_stats", force: :cascade do |t|
    t.integer "player_fifa_api_id",  limit: 8
    t.integer "player_id",           limit: 8
    t.text    "date_stat"
    t.integer "overall_rating",      limit: 8
    t.integer "potential",           limit: 8
    t.text    "preferred_foot"
    t.text    "attacking_work_rate"
    t.text    "defensive_work_rate"
    t.integer "crossing",            limit: 8
    t.integer "finishing",           limit: 8
    t.integer "heading_accuracy",    limit: 8
    t.integer "short_passing",       limit: 8
    t.integer "volleys",             limit: 8
    t.integer "dribbling",           limit: 8
    t.integer "curve",               limit: 8
    t.integer "free_kick_accuracy",  limit: 8
    t.integer "long_passing",        limit: 8
    t.integer "ball_control",        limit: 8
    t.integer "acceleration",        limit: 8
    t.integer "sprint_speed",        limit: 8
    t.integer "agility",             limit: 8
    t.integer "reactions",           limit: 8
    t.integer "balance",             limit: 8
    t.integer "shot_power",          limit: 8
    t.integer "jumping",             limit: 8
    t.integer "stamina",             limit: 8
    t.integer "strength",            limit: 8
    t.integer "long_shots",          limit: 8
    t.integer "aggression",          limit: 8
    t.integer "interceptions",       limit: 8
    t.integer "positioning",         limit: 8
    t.integer "vision",              limit: 8
    t.integer "penalties",           limit: 8
    t.integer "marking",             limit: 8
    t.integer "standing_tackle",     limit: 8
    t.integer "sliding_tackle",      limit: 8
    t.integer "gk_diving",           limit: 8
    t.integer "gk_handling",         limit: 8
    t.integer "gk_kicking",          limit: 8
    t.integer "gk_positioning",      limit: 8
    t.integer "gk_reflexes",         limit: 8
  end

  add_index "player_stats", ["player_id", "player_fifa_api_id", "date_stat"], name: "idx_twocols", unique: true, using: :btree

  create_table "players", id: :bigserial, force: :cascade do |t|
    t.text    "player_name"
    t.integer "player_fifa_api_id", limit: 8
    t.text    "birthday"
    t.float   "height"
    t.integer "weight",             limit: 8
  end

  create_table "seasons", id: :bigserial, force: :cascade do |t|
    t.text "name"
  end

  create_table "teams", id: :bigserial, force: :cascade do |t|
    t.text "name"
    t.text "short_name"
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
end
