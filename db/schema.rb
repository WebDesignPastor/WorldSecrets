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

ActiveRecord::Schema[7.0].define(version: 2023_05_16_102933) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "itinerary_id", null: false
    t.boolean "favorite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_bookmarks_on_itinerary_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departures", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "name"
    t.float "distance"
    t.integer "duration"
    t.integer "number_of_poi"
    t.string "departure"
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "category"
    t.text "description"
    t.string "subtitle"
    t.integer "rates", default: [], array: true
    t.index ["city_id"], name: "index_itineraries_on_city_id"
  end

  create_table "itinerary_pois", force: :cascade do |t|
    t.string "poi_order"
    t.bigint "itinerary_id", null: false
    t.bigint "poi_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itinerary_id"], name: "index_itinerary_pois_on_itinerary_id"
    t.index ["poi_id"], name: "index_itinerary_pois_on_poi_id"
  end

  create_table "pois", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "mystery_name"
    t.text "mystery_content"
    t.string "mystery_image"
    t.string "clue_image"
    t.string "clue_sentence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question_statement"
    t.bigint "itinerary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "answer_statement", default: [], array: true
    t.string "good_answer"
    t.index ["itinerary_id"], name: "index_questions_on_itinerary_id"
  end

  create_table "trip_answers", force: :cascade do |t|
    t.string "answer"
    t.bigint "question_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_trip_answers_on_question_id"
    t.index ["trip_id"], name: "index_trip_answers_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "proximity_level"
    t.string "image"
    t.text "content"
    t.string "status"
    t.integer "progress"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "itinerary_id"
    t.index ["itinerary_id"], name: "index_trips_on_itinerary_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookmarks", "itineraries"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "itineraries", "cities"
  add_foreign_key "itinerary_pois", "itineraries"
  add_foreign_key "itinerary_pois", "pois"
  add_foreign_key "questions", "itineraries"
  add_foreign_key "trip_answers", "questions"
  add_foreign_key "trip_answers", "trips"
  add_foreign_key "trips", "itineraries"
  add_foreign_key "trips", "users"
end
