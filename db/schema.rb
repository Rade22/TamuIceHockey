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

ActiveRecord::Schema.define(version: 2021_03_22_000933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", null: false
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "games", force: :cascade do |t|
    t.text "against_team"
    t.datetime "date"
    t.time "time"
    t.integer "goals_for"
    t.integer "goals_against"
    t.boolean "is_overtime"
    t.integer "powerplay_attemps"
    t.integer "killed_penalties"
    t.integer "total_penalties"
    t.text "city"
    t.text "ring_name"
    t.text "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "scrimmage"
  end

  create_table "participations", force: :cascade do |t|
    t.integer "player_id"
    t.integer "game_id"
    t.time "time_on_ice_goalie"
    t.integer "shots_against_goalie"
    t.integer "saves_goalie"
    t.integer "goals_against_goalie"
    t.integer "goals_skater"
    t.integer "assists_skater"
    t.integer "penalty_minutes_skater"
    t.integer "powerplay_goals_skater"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.text "first_name", null: false
    t.text "last_name", null: false
    t.integer "number"
    t.text "position", null: false
    t.boolean "active"
    t.text "image_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
