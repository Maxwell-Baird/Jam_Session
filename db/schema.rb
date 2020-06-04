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

ActiveRecord::Schema.define(version: 2020_06_04_040924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "study_sessions", force: :cascade do |t|
    t.integer "duration"
    t.string "topic"
    t.boolean "paired"
    t.bigint "user_id"
    t.index ["topic"], name: "index_study_sessions_on_topic"
    t.index ["user_id"], name: "index_study_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "spotify_token"
    t.string "refresh_token"
    t.integer "token_expiration"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

  add_foreign_key "study_sessions", "users"
end
