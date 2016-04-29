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

ActiveRecord::Schema.define(version: 20160428192653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hosts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "departing_city"
    t.string   "destination"
    t.integer  "seats_available"
    t.integer  "seat_price"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.date     "date_leave"
    t.date     "date_arrive"
    t.text     "comments"
  end

  create_table "pictures", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "pictures", ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "car_info"
    t.string   "home_city"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "password_digest"
    t.string   "auth_token"
    t.boolean  "driver",             default: false
    t.integer  "picture_id"
    t.string   "license_plate"
    t.string   "license_number"
    t.string   "credit_card_number"
    t.string   "name_on_card"
    t.string   "expiration_date"
    t.integer  "security_code"
  end

end
