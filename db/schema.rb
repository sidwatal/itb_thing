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

ActiveRecord::Schema[7.1].define(version: 2024_03_05_025202) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "loops", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "profile_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "starting_pilot_id"
    t.index ["profile_name"], name: "index_loops_on_profile_name", unique: true
    t.index ["starting_pilot_id"], name: "index_loops_on_starting_pilot_id"
  end

  create_table "pilots", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "nickname"
    t.string "debug_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["debug_name"], name: "index_pilots_on_debug_name", unique: true
    t.index ["name"], name: "index_pilots_on_name", unique: true
  end

  create_table "runs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "number", default: 0, null: false
    t.uuid "loop_id", null: false
    t.string "status", null: false
    t.string "result", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loop_id"], name: "index_runs_on_loop_id"
  end

  add_foreign_key "loops", "pilots", column: "starting_pilot_id"
  add_foreign_key "runs", "loops"
end
