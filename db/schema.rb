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

ActiveRecord::Schema.define(version: 20160120173945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "defensive_results", force: :cascade do |t|
    t.integer  "sack",       default: 0
    t.integer  "int",        default: 0
    t.integer  "int_td",     default: 0
    t.integer  "saf",        default: 0
    t.integer  "fumble_rec", default: 0
    t.integer  "fumble_td",  default: 0
    t.integer  "punt_blk",   default: 0
    t.integer  "pa",         default: 0
    t.integer  "matchup_id",             null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "defensive_results", ["matchup_id"], name: "index_defensive_results_on_matchup_id", using: :btree

  create_table "matchups", force: :cascade do |t|
    t.string   "dk_salary",  null: false
    t.integer  "team_id",    null: false
    t.integer  "player_id",  null: false
    t.integer  "period_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "matchups", ["period_id"], name: "index_matchups_on_period_id", using: :btree
  add_index "matchups", ["player_id"], name: "index_matchups_on_player_id", using: :btree
  add_index "matchups", ["team_id", "player_id", "period_id"], name: "index_matchups_on_team_id_and_player_id_and_period_id", unique: true, using: :btree
  add_index "matchups", ["team_id"], name: "index_matchups_on_team_id", using: :btree

  create_table "offensive_results", force: :cascade do |t|
    t.integer  "passing_att",   default: 0
    t.integer  "passing_comp",  default: 0
    t.integer  "passing_yds",   default: 0
    t.integer  "passing_td",    default: 0
    t.integer  "passing_int",   default: 0
    t.integer  "passing_2pt",   default: 0
    t.integer  "rushing_att",   default: 0
    t.integer  "rushing_yds",   default: 0
    t.integer  "rushing_td",    default: 0
    t.integer  "rushing_2pt",   default: 0
    t.integer  "receiving_tar", default: 0
    t.integer  "receiving_rec", default: 0
    t.integer  "receiving_yds", default: 0
    t.integer  "receiving_td",  default: 0
    t.integer  "receiving_2pt", default: 0
    t.integer  "fumbles_fl",    default: 0
    t.integer  "fumbles_td",    default: 0
    t.integer  "returns_ko",    default: 0
    t.integer  "returns_pnt",   default: 0
    t.integer  "matchup_id",                null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "offensive_results", ["matchup_id"], name: "index_offensive_results_on_matchup_id", using: :btree

  create_table "periods", force: :cascade do |t|
    t.string   "year",       null: false
    t.string   "week",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "periods", ["year", "week"], name: "index_periods_on_year_and_week", unique: true, using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "full_name",                                                     null: false
    t.string   "position",                                                      null: false
    t.string   "dk_number"
    t.string   "eligibility_flag", default: "0"
    t.string   "image",            default: "/fallback/default-player-img.png"
    t.integer  "team_id",                                                       null: false
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
  end

  add_index "players", ["full_name"], name: "index_players_on_full_name", using: :btree
  add_index "players", ["team_id"], name: "index_players_on_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "alt_abbr",   null: false
    t.string   "std_abbr",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
