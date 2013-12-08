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

ActiveRecord::Schema.define(version: 20131207232908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Users", id: false, force: true do |t|
    t.string   "id",         limit: 9,  null: false
    t.string   "privilege",  limit: 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calendar_items", force: true do |t|
    t.string   "name",       limit: 64
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "calendar_items", ["user_id"], name: "index_calendar_items_on_user_id", using: :btree

  create_table "calendar_items_viewers", force: true do |t|
    t.integer "calender_item_id"
    t.integer "user_id"
  end

  add_index "calendar_items_viewers", ["calender_item_id"], name: "index_calendar_items_viewers_on_calender_item_id", using: :btree
  add_index "calendar_items_viewers", ["user_id"], name: "index_calendar_items_viewers_on_user_id", using: :btree

  create_table "file_items", force: true do |t|
    t.string   "name",           limit: 64
    t.binary   "file"
    t.string   "permissions"
    t.string   "file_extension", limit: 10
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "file_items", ["user_id"], name: "index_file_items_on_user_id", using: :btree

  create_table "to_do_items", force: true do |t|
    t.string   "title",      limit: 64
    t.string   "details",    limit: 64
    t.datetime "date"
    t.string   "resources"
    t.boolean  "completed",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "to_do_items", ["user_id"], name: "index_to_do_items_on_user_id", using: :btree

  create_table "views", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
