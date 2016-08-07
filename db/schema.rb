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

ActiveRecord::Schema.define(version: 20160807033820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "country", force: :cascade do |t|
    t.text "name"
  end

  create_table "league", force: :cascade do |t|
    t.integer "country_id", limit: 8
    t.text    "name"
  end

  create_table "match", force: :cascade do |t|
    t.integer "country_id",       limit: 8
    t.integer "league_id",        limit: 8
    t.text    "season"
    t.integer "stage",            limit: 8
    t.text    "date"
    t.integer "match_api_id",     limit: 8
    t.integer "home_team_api_id", limit: 8
    t.integer "away_team_api_id", limit: 8
    t.integer "home_team_goal",   limit: 8
    t.integer "away_team_goal",   limit: 8
    t.integer "home_player_x1",   limit: 8
    t.integer "home_player_x2",   limit: 8
    t.integer "home_player_x3",   limit: 8
    t.integer "home_player_x4",   limit: 8
    t.integer "home_player_x5",   limit: 8
    t.integer "home_player_x6",   limit: 8
    t.integer "home_player_x7",   limit: 8
    t.integer "home_player_x8",   limit: 8
    t.integer "home_player_x9",   limit: 8
    t.integer "home_player_x10",  limit: 8
    t.integer "home_player_x11",  limit: 8
    t.integer "away_player_x1",   limit: 8
    t.integer "away_player_x2",   limit: 8
    t.integer "away_player_x3",   limit: 8
    t.integer "away_player_x4",   limit: 8
    t.integer "away_player_x5",   limit: 8
    t.integer "away_player_x6",   limit: 8
    t.integer "away_player_x7",   limit: 8
    t.integer "away_player_x8",   limit: 8
    t.integer "away_player_x9",   limit: 8
    t.integer "away_player_x10",  limit: 8
    t.integer "away_player_x11",  limit: 8
    t.integer "home_player_y1",   limit: 8
    t.integer "home_player_y2",   limit: 8
    t.integer "home_player_y3",   limit: 8
    t.integer "home_player_y4",   limit: 8
    t.integer "home_player_y5",   limit: 8
    t.integer "home_player_y6",   limit: 8
    t.integer "home_player_y7",   limit: 8
    t.integer "home_player_y8",   limit: 8
    t.integer "home_player_y9",   limit: 8
    t.integer "home_player_y10",  limit: 8
    t.integer "home_player_y11",  limit: 8
    t.integer "away_player_y1",   limit: 8
    t.integer "away_player_y2",   limit: 8
    t.integer "away_player_y3",   limit: 8
    t.integer "away_player_y4",   limit: 8
    t.integer "away_player_y5",   limit: 8
    t.integer "away_player_y6",   limit: 8
    t.integer "away_player_y7",   limit: 8
    t.integer "away_player_y8",   limit: 8
    t.integer "away_player_y9",   limit: 8
    t.integer "away_player_y10",  limit: 8
    t.integer "away_player_y11",  limit: 8
    t.integer "home_player_1",    limit: 8
    t.integer "home_player_2",    limit: 8
    t.integer "home_player_3",    limit: 8
    t.integer "home_player_4",    limit: 8
    t.integer "home_player_5",    limit: 8
    t.integer "home_player_6",    limit: 8
    t.integer "home_player_7",    limit: 8
    t.integer "home_player_8",    limit: 8
    t.integer "home_player_9",    limit: 8
    t.integer "home_player_10",   limit: 8
    t.integer "home_player_11",   limit: 8
    t.integer "away_player_1",    limit: 8
    t.integer "away_player_2",    limit: 8
    t.integer "away_player_3",    limit: 8
    t.integer "away_player_4",    limit: 8
    t.integer "away_player_5",    limit: 8
    t.integer "away_player_6",    limit: 8
    t.integer "away_player_7",    limit: 8
    t.integer "away_player_8",    limit: 8
    t.integer "away_player_9",    limit: 8
    t.integer "away_player_10",   limit: 8
    t.integer "away_player_11",   limit: 8
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
  end

  create_table "player", force: :cascade do |t|
    t.integer "player_api_id",      limit: 8
    t.text    "player_name"
    t.integer "player_fifa_api_id", limit: 8
    t.text    "birthday"
    t.float   "height"
    t.integer "weight",             limit: 8
  end

  add_index "player", ["player_api_id"], name: "player_api_id_uniq", unique: true, using: :btree

  create_table "player_stats", force: :cascade do |t|
    t.integer "player_fifa_api_id",  limit: 8
    t.integer "player_api_id",       limit: 8
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

  add_index "player_stats", ["player_api_id", "player_fifa_api_id", "date_stat"], name: "idx_twocols", unique: true, using: :btree

  create_table "team", force: :cascade do |t|
    t.integer "team_api_id",     limit: 8
    t.text    "team_long_name"
    t.text    "team_short_name"
  end

  add_index "team", ["team_api_id"], name: "team_api_id_uniq", unique: true, using: :btree

  add_foreign_key "league", "country", name: "league_country_fk"
  add_foreign_key "match", "country", name: "match_country_fk"
  add_foreign_key "match", "league", name: "match_league_fk"
  add_foreign_key "match", "player", column: "away_player_1", primary_key: "player_api_id", name: "match_away_player_1_player_fk"
  add_foreign_key "match", "player", column: "away_player_10", primary_key: "player_api_id", name: "match_away_player_10_player_fk"
  add_foreign_key "match", "player", column: "away_player_11", primary_key: "player_api_id", name: "match_away_player_11_player_fk"
  add_foreign_key "match", "player", column: "away_player_2", primary_key: "player_api_id", name: "match_away_player_2_player_fk"
  add_foreign_key "match", "player", column: "away_player_3", primary_key: "player_api_id", name: "match_away_player_3_player_fk"
  add_foreign_key "match", "player", column: "away_player_4", primary_key: "player_api_id", name: "match_away_player_4_player_fk"
  add_foreign_key "match", "player", column: "away_player_5", primary_key: "player_api_id", name: "match_away_player_5_player_fk"
  add_foreign_key "match", "player", column: "away_player_6", primary_key: "player_api_id", name: "match_away_player_6_player_fk"
  add_foreign_key "match", "player", column: "away_player_7", primary_key: "player_api_id", name: "match_away_player_7_player_fk"
  add_foreign_key "match", "player", column: "away_player_8", primary_key: "player_api_id", name: "match_away_player_8_player_fk"
  add_foreign_key "match", "player", column: "away_player_9", primary_key: "player_api_id", name: "match_away_player_9_player_fk"
  add_foreign_key "match", "player", column: "home_player_1", primary_key: "player_api_id", name: "match_home_player_1_player_fk"
  add_foreign_key "match", "player", column: "home_player_10", primary_key: "player_api_id", name: "match_home_player_10_player_fk"
  add_foreign_key "match", "player", column: "home_player_11", primary_key: "player_api_id", name: "match_home_player_11_player_fk"
  add_foreign_key "match", "player", column: "home_player_2", primary_key: "player_api_id", name: "match_home_player_2_player_fk"
  add_foreign_key "match", "player", column: "home_player_3", primary_key: "player_api_id", name: "match_home_player_3_player_fk"
  add_foreign_key "match", "player", column: "home_player_4", primary_key: "player_api_id", name: "match_home_player_4_player_fk"
  add_foreign_key "match", "player", column: "home_player_5", primary_key: "player_api_id", name: "match_home_player_5_player_fk"
  add_foreign_key "match", "player", column: "home_player_6", primary_key: "player_api_id", name: "match_home_player_6_player_fk"
  add_foreign_key "match", "player", column: "home_player_7", primary_key: "player_api_id", name: "match_home_player_7_player_fk"
  add_foreign_key "match", "player", column: "home_player_8", primary_key: "player_api_id", name: "match_home_player_8_player_fk"
  add_foreign_key "match", "player", column: "home_player_9", primary_key: "player_api_id", name: "match_home_player_9_player_fk"
  add_foreign_key "match", "team", column: "away_team_api_id", primary_key: "team_api_id", name: "match_away_team_fk"
  add_foreign_key "match", "team", column: "home_team_api_id", primary_key: "team_api_id", name: "match_home_team_fk"
end
