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

ActiveRecord::Schema.define(version: 20160124144352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hipstergrams", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
    t.integer  "hipster_id"
  end

  add_index "hipstergrams", ["hipster_id"], name: "index_hipstergrams_on_hipster_id", using: :btree

  create_table "hipsters", force: :cascade do |t|
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
    t.string   "provider"
    t.string   "uid"
    t.string   "hipstername"
  end

  add_index "hipsters", ["email"], name: "index_hipsters_on_email", unique: true, using: :btree
  add_index "hipsters", ["hipstername"], name: "index_hipsters_on_hipstername", unique: true, using: :btree
  add_index "hipsters", ["reset_password_token"], name: "index_hipsters_on_reset_password_token", unique: true, using: :btree

  create_table "like_before_cools", force: :cascade do |t|
    t.integer  "hipstergram_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "like_before_cools", ["hipstergram_id"], name: "index_like_before_cools_on_hipstergram_id", using: :btree

  add_foreign_key "hipstergrams", "hipsters"
  add_foreign_key "like_before_cools", "hipstergrams"
end
