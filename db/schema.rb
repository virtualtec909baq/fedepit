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

ActiveRecord::Schema.define(version: 20150605135921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "img"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
    t.string   "ancestry"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "parent_id"
  end

  add_index "canines", ["ancestry"], name: "index_canines_on_ancestry", using: :btree

  create_table "championships", force: :cascade do |t|
    t.integer  "type_championship_id"
    t.date     "date"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "name"
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
    t.float    "skull_width"
    t.float    "skull_high"
    t.float    "skull_diameter"
    t.float    "head_length"
    t.float    "skull_length"
    t.float    "muzzle_high"
    t.float    "skull_percentage"
    t.float    "muzzle_percentage"
    t.float    "heah_high"
    t.float    "muzzle_high_skull"
    t.string   "insertion_ear"
    t.boolean  "bite_pin"
    t.boolean  "bite_crusade_inside"
    t.boolean  "bite_prognato"
    t.boolean  "bite_enognato"
    t.boolean  "bite_fork_inverted"
    t.boolean  "bite_right"
    t.boolean  "dental_full"
    t.boolean  "dental_incisor"
    t.boolean  "dental_canine"
    t.boolean  "dental_molar"
    t.boolean  "dental_premolar"
    t.float    "muscular_general"
    t.float    "muscular_masetero"
    t.float    "muscle_parietale"
    t.float    "body_long"
    t.float    "body_raised"
    t.float    "diamter_thorax"
    t.boolean  "recommendation"
    t.boolean  "title_work"
    t.boolean  "test_strength"
    t.boolean  "test_dog_safe"
    t.boolean  "championsihp"
    t.boolean  "defects_bite"
    t.boolean  "lack_dental"
    t.boolean  "postponement"
    t.boolean  "entropion"
    t.boolean  "ectropion"
    t.boolean  "displacia_elbow"
    t.boolean  "displacia_hip"
    t.boolean  "problem_conduct"
    t.boolean  "defect_tail"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "canine_id"
  end

  create_table "images", force: :cascade do |t|
    t.integer  "canine_id"
    t.string   "file"
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

  create_table "sponsors", force: :cascade do |t|
    t.string   "image"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "url"
  end

  create_table "type_breeders", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_championships", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_events", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

end
