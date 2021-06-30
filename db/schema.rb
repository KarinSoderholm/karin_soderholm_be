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

ActiveRecord::Schema.define(version: 2021_06_29_171732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "artist_statements", force: :cascade do |t|
    t.string "statement"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_artist_statements_on_user_id"
  end

  create_table "artist_stories", force: :cascade do |t|
    t.string "story"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_artist_stories_on_user_id"
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

  create_table "artwork_collections", force: :cascade do |t|
    t.bigint "artwork_id"
    t.bigint "collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artwork_id"], name: "index_artwork_collections_on_artwork_id"
    t.index ["collection_id"], name: "index_artwork_collections_on_collection_id"
  end

  create_table "artwork_statements", force: :cascade do |t|
    t.text "statement"
    t.bigint "artwork_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artwork_id"], name: "index_artwork_statements_on_artwork_id"
  end

  create_table "artworks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "create_date"
    t.date "sell_date"
    t.float "cost"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "author"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_blog_posts_on_user_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "date"
    t.time "time"
    t.string "location"
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

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "collection_type"
    t.index ["collection_type"], name: "index_collections_on_collection_type"
  end

  create_table "commission_blooming_maps", force: :cascade do |t|
    t.string "customer_name"
    t.string "customer_email"
    t.string "customer_phone"
    t.string "message"
    t.string "map_city"
    t.string "map_state"
    t.string "map_country"
    t.string "map_flower"
    t.string "map_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "notes"
    t.string "commission_payment", default: "not_paid"
    t.float "price"
    t.string "commission_status", default: "not_started"
    t.index ["commission_payment"], name: "index_commission_blooming_maps_on_commission_payment"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "subject"
    t.string "customer_email_address"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "message_status", default: "unread"
    t.index ["message_status"], name: "index_contacts_on_message_status"
  end

  create_table "cvs", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cvs_on_user_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string "email_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "fabrics", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.bigint "clothing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clothing_id"], name: "index_fabrics_on_clothing_id"
  end

  create_table "frequently_asked_questions", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "faq_order", default: 1
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.bigint "artwork_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artwork_id"], name: "index_materials_on_artwork_id"
  end

  create_table "object_collections", force: :cascade do |t|
    t.bigint "clothing_id"
    t.bigint "collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clothing_id"], name: "index_object_collections_on_clothing_id"
    t.index ["collection_id"], name: "index_object_collections_on_collection_id"
  end

  create_table "order_artworks", force: :cascade do |t|
    t.bigint "artwork_id"
    t.bigint "order_id"
    t.float "price"
    t.integer "quantity"
    t.boolean "fulfilled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artwork_id"], name: "index_order_artworks_on_artwork_id"
    t.index ["order_id"], name: "index_order_artworks_on_order_id"
  end

  create_table "order_classrooms", force: :cascade do |t|
    t.bigint "classroom_id"
    t.bigint "order_id"
    t.float "price"
    t.integer "quantity"
    t.boolean "fulfilled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_order_classrooms_on_classroom_id"
    t.index ["order_id"], name: "index_order_classrooms_on_order_id"
  end

  create_table "order_clothings", force: :cascade do |t|
    t.bigint "clothing_id"
    t.bigint "order_id"
    t.float "price"
    t.integer "quantity"
    t.boolean "fulfilled", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clothing_id"], name: "index_order_clothings_on_clothing_id"
    t.index ["order_id"], name: "index_order_clothings_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "status", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "patterns", force: :cascade do |t|
    t.string "name"
    t.string "designer"
    t.bigint "clothing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clothing_id"], name: "index_patterns_on_clothing_id"
  end

  create_table "post_comments", force: :cascade do |t|
    t.text "comment"
    t.string "guest_name"
    t.string "guest_email"
    t.bigint "blog_post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blog_post_id"], name: "index_post_comments_on_blog_post_id"
  end

  create_table "requirements", force: :cascade do |t|
    t.string "name"
    t.bigint "classroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_requirements_on_classroom_id"
  end

  create_table "socials", force: :cascade do |t|
    t.string "linked_in"
    t.string "facebook"
    t.string "instagram"
    t.string "pinterest"
    t.string "twitter"
    t.string "email"
    t.bigint "user_id"
    t.string "etsy"
    t.index ["user_id"], name: "index_socials_on_user_id"
  end

  create_table "student_works", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "age_category", default: "young_adult"
  end

  create_table "tag_posts", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "blog_post_id"
    t.index ["blog_post_id"], name: "index_tag_posts_on_blog_post_id"
    t.index ["tag_id"], name: "index_tag_posts_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tools", force: :cascade do |t|
    t.string "name"
    t.bigint "classroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_tools_on_classroom_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.string "email"
    t.string "password_digest"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_zone", default: "UTC"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "artist_statements", "users"
  add_foreign_key "artist_stories", "users"
  add_foreign_key "artshow_artworks", "artshows"
  add_foreign_key "artshow_artworks", "artworks"
  add_foreign_key "artwork_collections", "artworks"
  add_foreign_key "artwork_collections", "collections"
  add_foreign_key "artwork_statements", "artworks"
  add_foreign_key "blog_posts", "users"
  add_foreign_key "cvs", "users"
  add_foreign_key "fabrics", "clothings"
  add_foreign_key "materials", "artworks"
  add_foreign_key "object_collections", "clothings"
  add_foreign_key "object_collections", "collections"
  add_foreign_key "order_artworks", "artworks"
  add_foreign_key "order_artworks", "orders"
  add_foreign_key "order_classrooms", "classrooms"
  add_foreign_key "order_classrooms", "orders"
  add_foreign_key "order_clothings", "clothings"
  add_foreign_key "order_clothings", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "patterns", "clothings"
  add_foreign_key "post_comments", "blog_posts"
  add_foreign_key "requirements", "classrooms"
  add_foreign_key "socials", "users"
  add_foreign_key "tag_posts", "blog_posts"
  add_foreign_key "tag_posts", "tags"
  add_foreign_key "tools", "classrooms"
end
