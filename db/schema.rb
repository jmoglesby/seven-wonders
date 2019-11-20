# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_20_065031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_sessions", force: :cascade do |t|
    t.integer "creator_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "teams"
    t.boolean "leaders_expansion"
    t.boolean "cities_expansion"
    t.boolean "babel_tower_expansion"
    t.boolean "babel_projects_expansion"
    t.boolean "armada_expansion"
  end

  create_table "game_sessions_users", force: :cascade do |t|
    t.bigint "game_session_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_session_id"], name: "index_game_sessions_users_on_game_session_id"
    t.index ["user_id"], name: "index_game_sessions_users_on_user_id"
  end

  create_table "score_cards", force: :cascade do |t|
    t.integer "plus_one_military_victory_tokens", default: 0
    t.integer "plus_three_military_victory_tokens", default: 0
    t.integer "plus_five_military_victory_tokens", default: 0
    t.integer "plus_seven_military_victory_tokens", default: 0
    t.integer "minus_one_military_victory_tokens", default: 0
    t.integer "minus_two_military_victory_tokens", default: 0
    t.integer "minus_three_military_victory_tokens", default: 0
    t.integer "coin_total", default: 0
    t.integer "debt_total", default: 0
    t.integer "wonder_points", default: 0
    t.integer "blue_card_points", default: 0
    t.integer "yellow_card_points", default: 0
    t.integer "black_card_points", default: 0
    t.integer "purple_card_points", default: 0
    t.integer "tablet_symbols", default: 0
    t.integer "cog_symbols", default: 0
    t.integer "compass_symbols", default: 0
    t.integer "wildcard_symbols", default: 0
    t.integer "leader_points", default: 0
    t.integer "fleet_points", default: 0
    t.integer "babel_tiles_played", default: 0
    t.integer "great_project_token_points", default: 0
    t.integer "great_project_penalty_total", default: 0
    t.integer "user_id"
    t.integer "game_session_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_session_id"], name: "index_score_cards_on_game_session_id"
    t.index ["user_id"], name: "index_score_cards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
