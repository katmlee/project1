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

ActiveRecord::Schema.define(version: 20160711090751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "destinations", force: :cascade do |t|
    t.string   "city"
    t.string   "country"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "who"
    t.text     "purpose"
    t.text     "favorite_part"
    t.text     "photos"
    t.text     "map_link"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "trip_synopsis"
    t.text     "must_see"
    t.text     "must_do"
    t.text     "must_eat"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "email"
    t.date     "birthdate"
    t.string   "current_city"
    t.string   "fav_destination"
    t.text     "about_me"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "image"
    t.float    "latitude"
    t.float    "longitude"
  end

end
