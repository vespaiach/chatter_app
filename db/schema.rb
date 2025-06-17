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

ActiveRecord::Schema[8.0].define(version: 2025_06_14_163148) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

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

  create_table "chats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.text "message"
    t.jsonb "custom_data", default: {}, null: false
    t.timestamptz "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_chats_on_created_at", unique: true
    t.index ["deleted_at"], name: "index_chats_on_deleted_at"
    t.index ["room_id", "id"], name: "index_chats_on_room_id_and_id"
    t.index ["room_id"], name: "index_chats_on_room_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "join_requests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.string "status", default: "pending", null: false
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.timestamptz "deleted_at"
    t.index ["deleted_at"], name: "index_join_requests_on_deleted_at"
    t.index ["room_id"], name: "index_join_requests_on_room_id"
    t.index ["user_id", "room_id"], name: "index_join_requests_on_user_id_and_room_id", unique: true
    t.index ["user_id"], name: "index_join_requests_on_user_id"
  end

  create_table "room_users", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "user_id", null: false
    t.timestamptz "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id", "user_id"], name: "index_room_users_on_room_id_and_user_id", unique: true
    t.index ["room_id"], name: "index_room_users_on_room_id"
    t.index ["user_id"], name: "index_room_users_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.timestamptz "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.timestamptz "last_login_at"
    t.timestamptz "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "online_status", default: false, null: false
    t.string "password_reset_token"
    t.timestamptz "password_reset_sent_at"
    t.datetime "last_seen_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chats", "rooms"
  add_foreign_key "chats", "users"
  add_foreign_key "join_requests", "rooms"
  add_foreign_key "join_requests", "users"
  add_foreign_key "room_users", "rooms"
  add_foreign_key "room_users", "users"
  add_foreign_key "rooms", "users"
end
