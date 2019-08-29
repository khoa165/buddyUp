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

ActiveRecord::Schema.define(version: 2019_08_20_095016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.integer "score"
    t.string "status_receiver"
    t.string "status_sender"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_connections_on_receiver_id"
    t.index ["sender_id"], name: "index_connections_on_sender_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.string "location"
    t.date "date"
    t.string "category"
    t.string "activities"
    t.text "notes"
    t.float "latitude"
    t.float "longitude"
    t.bigint "connection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connection_id"], name: "index_meetings_on_connection_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.boolean "seen", default: false
    t.bigint "connection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connection_id"], name: "index_messages_on_connection_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "description"
    t.boolean "is_required", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "question_id"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_responses_on_question_id"
  end

  create_table "user_responses", force: :cascade do |t|
    t.bigint "response_id"
    t.bigint "user_id"
    t.text "free_response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["response_id"], name: "index_user_responses_on_response_id"
    t.index ["user_id"], name: "index_user_responses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.string "intro"
    t.integer "age"
    t.string "occupation"
    t.string "address"
    t.string "city"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.string "gender"
    t.boolean "premium_status", default: false
    t.boolean "first_time_visit", default: true
    t.boolean "in_session", default: false
    t.string "photo", default: "https://images.unsplash.com/photo-1548199973-03cce0bbc87b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
    t.string "search_term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "connections", "users", column: "receiver_id"
  add_foreign_key "connections", "users", column: "sender_id"
  add_foreign_key "meetings", "connections"
  add_foreign_key "messages", "connections"
  add_foreign_key "messages", "users"
  add_foreign_key "responses", "questions"
  add_foreign_key "user_responses", "responses"
  add_foreign_key "user_responses", "users"
end
