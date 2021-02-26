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

ActiveRecord::Schema.define(version: 2021_02_23_062608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "against_team", null: false
    t.datetime "date", null: false
    t.text "location", null: false
    t.integer "score"
    t.integer "opposing_score"
    t.integer "game_stats_id"
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

  create_table "participations", force: :cascade do |t|
    t.integer "player_id"
    t.integer "game_id"
    t.integer "player_stats_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "time_on_ice"
    t.integer "goals"
    t.integer "assists"
    t.integer "penalty_minutes"
    t.integer "powerplay_goals"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name", null: false
    t.string "position"
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
