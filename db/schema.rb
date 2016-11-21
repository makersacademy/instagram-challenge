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

ActiveRecord::Schema.define(version: 20160306192404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "picture_id"
    t.string   "user"
    t.integer  "user_id"
  end

  add_index "comments", ["picture_id"], name: "index_comments_on_picture_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "tags"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
  end

  add_index "pictures", ["user_id"], name: "index_pictures_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.text     "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "picture_id"
  end

  add_index "tags", ["picture_id"], name: "index_tags_on_picture_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "user_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["user_id"], name: "index_users_on_user_id", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "comments", "pictures"
  add_foreign_key "comments", "users"
  add_foreign_key "pictures", "users"
  add_foreign_key "tags", "pictures"
  add_foreign_key "users", "users"
end
