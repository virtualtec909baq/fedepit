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

ActiveRecord::Schema.define(version: 20150827203803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "img"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "author"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "parent_id"
    t.string   "kind"
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

  create_table "features", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "canine_id"
    t.integer  "teeth"
    t.integer  "canines"
    t.integer  "deciduous_tooth"
    t.integer  "incisors_alignment"
    t.integer  "molar_tooth"
    t.integer  "premolar_tooth"
    t.integer  "jowl"
    t.integer  "moving_poise"
    t.integer  "static_poise"
    t.integer  "neck"
    t.integer  "shoulder"
    t.integer  "chest"
    t.integer  "body"
    t.integer  "upper_body"
    t.integer  "body_alterations"
    t.float    "height"
    t.float    "length"
    t.float    "torax_length"
    t.float    "depths_chest"
    t.integer  "after_moving"
    t.integer  "subsequent_static"
    t.integer  "shaped_tail"
    t.integer  "tail_length"
    t.integer  "tail_movement"
    t.integer  "muscle_quality"
    t.integer  "attitude"
    t.integer  "general_appearance"
    t.integer  "ears"
    t.integer  "shape_ears"
    t.integer  "shape_eyes"
    t.integer  "eyes_placement"
    t.integer  "color_eyes"
    t.integer  "eyelid_abnormalities"
    t.integer  "head_measures"
    t.integer  "flat_head"
    t.integer  "head_shape"
    t.integer  "head_stop"
    t.integer  "snout"
    t.integer  "nouse"
    t.integer  "nose_nostrils"
    t.integer  "motion"
    t.integer  "snout_2"
    t.integer  "cigamatico_snout"
    t.integer  "supracillares_snout"
    t.integer  "cheeks_snout"
    t.integer  "muzzle_bite"
    t.integer  "lips"
    t.integer  "appearance"
    t.integer  "length_chest"
    t.integer  "typical_head"
    t.integer  "cheek"
    t.integer  "bite"
    t.integer  "deciduous"
    t.string   "color"
    t.string   "canine_name"
    t.string   "breeder_name"
    t.string   "breeder_phone"
    t.string   "breeder_email"
    t.string   "canine_race"
    t.string   "canine_lof"
    t.string   "canine_birth"
    t.string   "canine_gender"
    t.string   "canine_color"
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

  create_table "paragraphs", force: :cascade do |t|
    t.text     "description"
    t.string   "img"
    t.integer  "article_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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

  create_table "sponsors", force: :cascade do |t|
    t.string   "image"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "url"
    t.string   "email"
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

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.integer  "number_seen"
    t.string   "url"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "description"
    t.integer  "type_category_id"
  end

end
