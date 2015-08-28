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

ActiveRecord::Schema.define(version: 20150828201044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bands", force: :cascade do |t|
    t.string   "name"
    t.string   "country_from"
    t.string   "music_style"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "bio"
  end

  create_table "concerts", force: :cascade do |t|
    t.integer  "band_id"
    t.integer  "venue_id"
    t.boolean  "played_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.integer  "attendance"
  end

  add_index "concerts", ["band_id"], name: "index_concerts_on_band_id", using: :btree
  add_index "concerts", ["venue_id"], name: "index_concerts_on_venue_id", using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.string   "pic_link"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
