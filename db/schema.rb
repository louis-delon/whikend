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

ActiveRecord::Schema.define(version: 20180301131754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkpoints", force: :cascade do |t|
    t.float "lat"
    t.float "lng"
    t.float "ele"
    t.integer "order"
    t.bigint "hike_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hike_id"], name: "index_checkpoints_on_hike_id"
  end

  create_table "hikes", force: :cascade do |t|
    t.string "duration"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "distance"
    t.string "asc_elevation"
    t.string "desc_elevation"
    t.string "alt_min"
    t.string "alt_max"
    t.string "difficulty"
    t.boolean "hike_type"
    t.text "description"
    t.string "department"
    t.string "title"
    t.string "link"
    t.integer "site_id"
    t.string "photo_url"
    t.string "photo"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "trip_id"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_messages_on_trip_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.bigint "trip_id"
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_reviews_on_receiver_id"
    t.index ["sender_id"], name: "index_reviews_on_sender_id"
    t.index ["trip_id"], name: "index_reviews_on_trip_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.string "content"
    t.boolean "accepted"
    t.bigint "user_id"
    t.bigint "trip_id"
    t.index ["trip_id"], name: "index_submissions_on_trip_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.date "date"
    t.string "start_location"
    t.bigint "user_id"
    t.bigint "hike_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seats"
    t.boolean "auto_accept", default: false
    t.string "title"
    t.string "trip_type"
    t.index ["hike_id"], name: "index_trips_on_hike_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "description"
    t.integer "age"
    t.string "avatar_url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "checkpoints", "hikes"
  add_foreign_key "messages", "trips"
  add_foreign_key "messages", "users"
  add_foreign_key "reviews", "trips"
  add_foreign_key "reviews", "users", column: "receiver_id"
  add_foreign_key "reviews", "users", column: "sender_id"
  add_foreign_key "submissions", "trips"
  add_foreign_key "submissions", "users"
  add_foreign_key "trips", "hikes"
  add_foreign_key "trips", "users"
end
