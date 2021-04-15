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

ActiveRecord::Schema.define(version: 2021_04_15_215815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artworks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image"
    t.string "materials"
    t.date "create_date"
    t.date "sell_date"
    t.float "cost"
    t.string "art_shows"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image"
    t.date "date"
    t.time "time"
    t.string "location"
    t.string "requirements"
    t.string "tools_needed"
    t.float "cost"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clothings", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image"
    t.string "fabric"
    t.string "url"
    t.string "category"
    t.boolean "available"
    t.string "pattern_name"
    t.date "origin_date"
    t.float "pattern_cost"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
