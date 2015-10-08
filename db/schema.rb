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

ActiveRecord::Schema.define(version: 20151008132141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: :cascade do |t|
    t.string   "brand",      null: false
    t.string   "style",      null: false
    t.string   "color"
    t.string   "alcohol"
    t.string   "bitterness"
    t.string   "size"
    t.boolean  "draft"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "brewery_id", null: false
  end

  add_index "beers", ["brewery_id"], name: "index_beers_on_brewery_id", using: :btree

  create_table "beers_venues", id: false, force: :cascade do |t|
    t.integer "venue_id", null: false
    t.integer "beer_id",  null: false
  end

  add_index "beers_venues", ["venue_id", "beer_id"], name: "index_beers_venues_on_venue_id_and_beer_id", using: :btree

  create_table "breweries", force: :cascade do |t|
    t.string   "name"
    t.string   "brewery_type"
    t.string   "department"
    t.string   "city"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.string   "web"
    t.boolean  "serves_people"
    t.string   "foursquare_id"
    t.decimal  "lat"
    t.decimal  "lng"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "foursquare_url"
    t.string   "photo_prefix"
    t.string   "photo_suffix"
  end

  create_table "open_hours", force: :cascade do |t|
    t.integer "day",                        null: false
    t.time    "start",                      null: false
    t.time    "end",                        null: false
    t.boolean "next_day",   default: false, null: false
    t.integer "venue_id",                   null: false
    t.string  "venue_type",                 null: false
  end

  add_index "open_hours", ["venue_type", "venue_id"], name: "index_open_hours_on_venue_type_and_venue_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",     default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "venue_type"
    t.string   "department"
    t.string   "city"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.string   "web"
    t.string   "foursquare_id"
    t.decimal  "lat"
    t.decimal  "lng"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "foursquare_url"
    t.string   "photo_prefix"
    t.string   "photo_suffix"
  end

  add_foreign_key "beers", "breweries"
end
