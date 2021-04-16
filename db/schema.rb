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

ActiveRecord::Schema.define(version: 2021_04_16_032601) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artist_statements", force: :cascade do |t|
    t.string "name"
    t.text "statement"
    t.bigint "artwork_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artwork_id"], name: "index_artist_statements_on_artwork_id"
  end

  create_table "artshow_artworks", force: :cascade do |t|
    t.bigint "artshow_id"
    t.bigint "artwork_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artshow_id"], name: "index_artshow_artworks_on_artshow_id"
    t.index ["artwork_id"], name: "index_artshow_artworks_on_artwork_id"
  end

  create_table "artshows", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.date "start_date"
    t.date "end_date"
    t.float "entry_fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artworks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image"
    t.date "create_date"
    t.date "sell_date"
    t.float "cost"
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
    t.string "url"
    t.string "category"
    t.boolean "available"
    t.date "origin_date"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fabrics", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.bigint "clothing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clothing_id"], name: "index_fabrics_on_clothing_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.bigint "artwork_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artwork_id"], name: "index_materials_on_artwork_id"
  end

  create_table "patterns", force: :cascade do |t|
    t.string "name"
    t.string "designer"
    t.bigint "clothing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clothing_id"], name: "index_patterns_on_clothing_id"
  end

  create_table "requirements", force: :cascade do |t|
    t.string "name"
    t.bigint "classroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_requirements_on_classroom_id"
  end

  create_table "tools", force: :cascade do |t|
    t.string "name"
    t.bigint "classroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_tools_on_classroom_id"
  end

  add_foreign_key "artist_statements", "artworks"
  add_foreign_key "artshow_artworks", "artshows"
  add_foreign_key "artshow_artworks", "artworks"
  add_foreign_key "fabrics", "clothings"
  add_foreign_key "materials", "artworks"
  add_foreign_key "patterns", "clothings"
  add_foreign_key "requirements", "classrooms"
  add_foreign_key "tools", "classrooms"
end