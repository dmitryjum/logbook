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

ActiveRecord::Schema.define(version: 20140303061812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jump_users", force: true do |t|
    t.integer "user_id"
    t.integer "jump_id"
  end

  create_table "jumps", force: true do |t|
    t.integer "jump_number"
    t.date    "date"
    t.string  "location"
    t.integer "freefall_time"
    t.string  "equipment"
    t.string  "aircraft"
    t.integer "total_freefall_time"
    t.text    "notes"
    t.integer "exit_altitude"
    t.integer "user_id"
  end

  create_table "pictures", force: true do |t|
    t.string  "name"
    t.text    "picture_url"
    t.integer "jump_id"
  end

  create_table "users", force: true do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.date   "dob"
    t.string "license_number"
    t.string "password_digest"
  end

  create_table "videos", force: true do |t|
    t.string  "name"
    t.text    "video_url"
    t.integer "jump_id"
  end

end
