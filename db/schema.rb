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

ActiveRecord::Schema.define(version: 20140614105212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: true do |t|
    t.integer  "driver_id"
    t.datetime "leave_at",    null: false
    t.string   "leave_from",  null: false
    t.string   "route",       null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",                                null: false
    t.string   "profile_image",                       null: false
    t.datetime "leave_after",                         null: false
    t.datetime "leave_before",                        null: false
    t.string   "destination_address",                 null: false
    t.float    "dest_lat"
    t.float    "dest_long"
    t.boolean  "has_car",             default: false
    t.integer  "car_spots",           default: 0
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree
  add_index "users", ["leave_after"], name: "index_users_on_leave_after", using: :btree
  add_index "users", ["leave_before"], name: "index_users_on_leave_before", using: :btree

end
