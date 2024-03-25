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

ActiveRecord::Schema[7.0].define(version: 2024_03_25_135335) do
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

  create_table "agents", force: :cascade do |t|
    t.integer "auth0_ID"
    t.string "name", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "reset_digest", null: false
    t.time "start_at", null: false
    t.time "end_at", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_agents_on_email", unique: true
    t.index ["name"], name: "index_agents_on_name", unique: true
  end

  create_table "amenities", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.boolean "parking", null: false
    t.boolean "bath", default: false, null: false
    t.boolean "wash_machine", default: false, null: false
    t.boolean "aircon", default: false, null: false
    t.boolean "lock", default: false, null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_amenities_on_property_id"
  end

  create_table "areas", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.string "prefecture", null: false
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_areas_on_property_id"
  end

  create_table "holidays", force: :cascade do |t|
    t.bigint "agent_id", null: false
    t.boolean "mon", default: false, null: false
    t.boolean "tue", default: false, null: false
    t.boolean "wed", default: false, null: false
    t.boolean "thu", default: false, null: false
    t.boolean "fri", default: false, null: false
    t.boolean "sat", default: false, null: false
    t.boolean "sun", default: false, null: false
    t.boolean "national_holiday", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_holidays_on_agent_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "agent_id", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.integer "inquiry_type", default: 0, null: false
    t.string "contents"
    t.boolean "is_replied", default: false, null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_inquiries_on_agent_id"
    t.index ["user_id"], name: "index_inquiries_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "property_id", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_likes_on_property_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "lines", force: :cascade do |t|
    t.integer "line_cd"
    t.integer "company_cd"
    t.string "line_name"
    t.string "line_name_k"
    t.string "line_name_h"
    t.string "line_color_c"
    t.string "line_color_t"
    t.string "line_type"
    t.float "lon"
    t.float "lat"
    t.integer "zoom"
    t.integer "e_status"
    t.integer "e_sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "municipalities", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.integer "prefecture_id"
    t.string "prefecture_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "near_stations", force: :cascade do |t|
    t.bigint "property_id", null: false
    t.string "line", null: false
    t.string "name", null: false
    t.integer "minute_walk", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_near_stations_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.bigint "agent_id", null: false
    t.string "name", null: false
    t.integer "rent", null: false
    t.integer "deposit", null: false
    t.integer "honorarium", null: false
    t.integer "management_fee", null: false
    t.string "layout", null: false
    t.integer "property_type", default: 0, null: false
    t.date "build_date", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_properties_on_agent_id"
  end

  create_table "stations", force: :cascade do |t|
    t.integer "station_cd"
    t.integer "station_g_cd"
    t.string "station_name"
    t.string "station_name_k"
    t.string "station_name_r"
    t.integer "line_cd"
    t.integer "pref_cd"
    t.string "post"
    t.string "address"
    t.float "lon"
    t.float "lat"
    t.date "open_ymd"
    t.date "close_ymd"
    t.integer "e_statu"
    t.integer "e_sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "auth0_ID", null: false
    t.string "email", null: false
    t.string "address", null: false
    t.string "postal_code", null: false
    t.string "phone_number", null: false
    t.string "password_digest", null: false
    t.string "reset_digest"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auth0_ID"], name: "index_users_on_auth0_ID", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "amenities", "properties"
  add_foreign_key "areas", "properties"
  add_foreign_key "holidays", "agents"
  add_foreign_key "inquiries", "agents"
  add_foreign_key "inquiries", "users"
  add_foreign_key "likes", "properties"
  add_foreign_key "likes", "users"
  add_foreign_key "near_stations", "properties"
  add_foreign_key "properties", "agents"
end
