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

ActiveRecord::Schema.define(version: 20141117000302) do

  create_table "relationships", force: true do |t|
    t.integer "wiki_id"
    t.integer "user_id"
    t.boolean "creator_created"
    t.boolean "collaborator"
  end

  add_index "relationships", ["id"], name: "index_relationships_on_id", unique: true
  add_index "relationships", ["user_id"], name: "index_relationships_on_user_id"
  add_index "relationships", ["wiki_id"], name: "index_relationships_on_wiki_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "premium"
    t.string   "stripe_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["id"], name: "index_users_on_id", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "wikis", force: true do |t|
    t.string   "title"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "body"
    t.boolean  "personal"
  end

  add_index "wikis", ["id"], name: "index_wikis_on_id", unique: true

end
