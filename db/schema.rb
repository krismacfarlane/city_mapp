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

ActiveRecord::Schema.define(version: 20150312220633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "circles", force: :cascade do |t|
    t.float    "lat",        null: false
    t.float    "long",       null: false
    t.string   "radius"
    t.integer  "map_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "state",      null: false
    t.integer  "population", null: false
    t.string   "website",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lines", force: :cascade do |t|
  end

  create_table "maps", force: :cascade do |t|
    t.string   "title",      null: false
    t.integer  "user_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "markers", force: :cascade do |t|
    t.float    "lat",           null: false
    t.float    "long",          null: false
    t.string   "popup_content"
    t.integer  "map_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "polygons", force: :cascade do |t|
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
