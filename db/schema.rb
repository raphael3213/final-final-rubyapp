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

ActiveRecord::Schema.define(version: 20190116095239) do

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "blogs", ["user_id", "created_at"], name: "index_blogs_on_user_id_and_created_at"
  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["blog_id"], name: "index_comments_on_blog_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "inventories", force: :cascade do |t|
    t.string   "item_type"
    t.string   "sku"
    t.string   "Title"
    t.string   "serial_number"
    t.integer  "quantity"
    t.integer  "price"
    t.string   "organization"
    t.integer  "Length"
    t.integer  "Breadth"
    t.integer  "Height"
    t.integer  "Weight"
    t.text     "description"
    t.text     "short_description"
    t.string   "asset_code"
    t.string   "grade"
    t.string   "category"
    t.string   "brand"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "Volume"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["blog_id"], name: "index_likes_on_blog_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
