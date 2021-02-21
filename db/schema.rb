# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_21_225108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_stats", force: :cascade do |t|
    t.string "opposing_team"
    t.date "date"
    t.string "location"
    t.integer "home_score"
    t.integer "opposing_score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "wins"
    t.integer "losses"
    t.integer "overtime_shootout_losses"
    t.integer "overtime_wins"
    t.integer "goals_for"
    t.integer "goals_against"
  end

  create_table "logins", force: :cascade do |t|
    t.string "username"
    t.string "hashed_password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_stats", force: :cascade do |t|
    t.integer "games_played"
    t.integer "wins"
    t.integer "losses"
    t.integer "overtime_shootout_losses"
    t.integer "goals_against"
    t.integer "time_on_ice"
    t.integer "goals"
    t.integer "assists"
    t.integer "penalty_minutes"
    t.integer "powerplay_goals"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "playerid"
    t.integer "gameid"
  end

  create_table "players", force: :cascade do |t|
    t.text "first_name", null: false
    t.text "last_name", null: false
    t.text "position", null: false
    t.integer "number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
