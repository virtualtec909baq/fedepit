# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151020222346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "animations", force: :cascade do |t|
    t.text     "description"
    t.string   "title"
    t.string   "url"
    t.integer  "type_category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "img"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "author"
  end

  create_table "association_characteristics", force: :cascade do |t|
    t.integer  "characteristic_id"
    t.integer  "characteristic_detail_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "breeders", force: :cascade do |t|
    t.integer  "type_breeder_id"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "name_breed"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "web"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "img"
    t.string   "country"
    t.string   "city"
    t.string   "adrress"
  end

  create_table "canines", force: :cascade do |t|
    t.integer  "race_id"
    t.integer  "breeder_id"
    t.string   "lof"
    t.string   "chip"
    t.string   "name"
    t.integer  "gender"
    t.integer  "color_id"
    t.string   "father_lof"
    t.string   "mother_lof"
    t.float    "rate"
    t.date     "birth"
    t.date     "death"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "parent_id"
    t.string   "kind"
    t.string   "color"
    t.string   "propietary"
    t.string   "new_register"
    t.integer  "characteristics_id"
  end

  add_index "canines", ["characteristics_id"], name: "index_canines_on_characteristics_id", using: :btree

  create_table "canino_characteristics", force: :cascade do |t|
    t.integer  "characteristic_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "canine_id"
    t.integer  "temporal_id",          limit: 8
    t.string   "temporal_canine_name"
    t.integer  "value"
    t.boolean  "status"
    t.string   "temporal_race"
    t.string   "temporal_variety"
    t.string   "temporal_lof"
    t.string   "temporal_birth"
    t.string   "temporal_color"
    t.string   "temporal_sex"
    t.string   "temporal_owner"
    t.string   "temporal_phone"
    t.string   "temporal_email"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_race_varieties", force: :cascade do |t|
    t.integer  "race_id"
    t.integer  "variety_id"
    t.integer  "category_id"
    t.integer  "tournament_id"
    t.boolean  "punctuation"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
  end

  create_table "champions", force: :cascade do |t|
    t.integer  "canine_id"
    t.integer  "category_race_variety_id"
    t.integer  "spectacle_id"
    t.date     "date"
    t.float    "points"
    t.string   "position"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "winner"
  end

  create_table "characteristic_details", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "characteristics", force: :cascade do |t|
    t.integer  "measure_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order"
  end

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "article_id"
    t.string   "name_user"
    t.string   "email_user"
    t.string   "message"
    t.integer  "report"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "type_event_id"
    t.string   "name"
    t.string   "description"
    t.date     "date"
    t.string   "place"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "img"
  end

  create_table "images", force: :cascade do |t|
    t.integer  "canine_id"
    t.string   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "img_races", force: :cascade do |t|
    t.integer  "race_id"
    t.string   "img"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "measures", force: :cascade do |t|
    t.string   "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paragraphs", force: :cascade do |t|
    t.text     "description"
    t.string   "img"
    t.integer  "article_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publicities", force: :cascade do |t|
    t.string   "image"
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "pdf"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "spectacles", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "image"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "url"
    t.string   "email"
  end

  create_table "standar_types", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "standards", force: :cascade do |t|
    t.integer  "race_id"
    t.integer  "characteristic_id"
    t.integer  "standar_type_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.float    "rg_lt"
    t.float    "rg_gteq"
    t.integer  "age_lt"
    t.integer  "age_gteq"
    t.string   "description"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_breeders", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_categories", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_events", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "championship"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "varieties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
