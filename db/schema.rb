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

ActiveRecord::Schema[7.0].define(version: 2022_12_09_104040) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
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

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "kanji_stores", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.serial "kanji_org", null: false
    t.string "kanji_code", null: false
    t.integer "kanji_no"
    t.jsonb "kanji_vocab"
    t.string "unit_sheet"
    t.jsonb "kanji_parts"
    t.text "parts_body"
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["kanji_org"], name: "index_kanji_stores_on_kanji_org", unique: true
  end

  create_table "parts_stores", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.serial "parts_org", null: false
    t.string "parts_code", null: false
    t.integer "parts_stroke"
    t.jsonb "parts_kanji"
    t.text "kanji_body"
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["parts_org"], name: "index_parts_stores_on_parts_org", unique: true
  end

  create_table "read_stores", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.serial "read_org", null: false
    t.string "read_code", null: false
    t.integer "vocab_org", null: false
    t.string "vocab_code", null: false
    t.jsonb "read_vocab"
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["read_org"], name: "index_read_stores_on_read_org", unique: true
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
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
    t.datetime "deleted_at"
    t.uuid "created_by"
    t.uuid "updated_by"
    t.uuid "deleted_by"
    t.string "sei"
    t.string "mei"
    t.string "sei_kana"
    t.string "mei_kana"
    t.string "mobile"
    t.string "lang_id", default: "EN", null: false
    t.string "company_name", default: "", null: false
    t.string "business_type", default: "", null: false
    t.string "company_url", default: "", null: false
    t.string "department_name", default: "", null: false
    t.string "kana_sei", default: "", null: false
    t.string "kana_mei", default: "", null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vocab_mycards", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.integer "vocab_mycard_org", null: false
    t.integer "vocab_org", null: false
    t.string "vocab_code", null: false
    t.string "vocab_read"
    t.text "kanji_body"
    t.integer "jlpt_class"
    t.string "jlpt_level"
    t.text "parts_body"
    t.date "recent_date"
    t.integer "mycard_check"
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["user_id"], name: "index_vocab_mycards_on_user_id"
  end

  create_table "vocab_stores", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.serial "vocab_org", null: false
    t.string "vocab_code", null: false
    t.integer "vocab_num"
    t.string "vocab_read"
    t.string "unit_sheet"
    t.string "kanji_sheet"
    t.jsonb "vocab_kanji"
    t.jsonb "nation_vocab", default: {}
    t.integer "jlpt_class", default: 0
    t.string "jlpt_level"
    t.integer "vocab_seq", default: 0
    t.boolean "excel_flag", default: false, null: false
    t.text "genre"
    t.boolean "active_sign", default: true, null: false
    t.uuid "created_by", null: false
    t.uuid "updated_by", null: false
    t.uuid "deleted_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["vocab_org"], name: "index_vocab_stores_on_vocab_org", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "vocab_mycards", "users"
end
