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

ActiveRecord::Schema.define(version: 20150917123115) do

  create_table "chats", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "list_id"
    t.string   "user_chat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.integer  "mk_room_id"
    t.string   "person_1"
    t.string   "person_2"
    t.string   "person_3"
    t.string   "person_4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mk_rooms", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "univ_id"
    t.string   "course"
    t.integer  "user_hour"
    t.integer  "user_minute"
    t.string   "girl_only"
    t.boolean  "finish",           default: false
    t.integer  "num_member_limit"
    t.integer  "num_of_user_join", default: 1
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "univs", force: :cascade do |t|
    t.string   "uni_email"
    t.boolean  "campus",      default: false
    t.string   "uni_name"
    t.string   "uni_route_1"
    t.string   "uni_route_2"
    t.string   "uni_route_3"
    t.string   "uni_route_4"
    t.string   "uni_route_5"
    t.string   "uni_route_6"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "list_id"
    t.integer  "univ_id"
    t.integer  "mk_room_id"
    t.boolean  "register_to_use",        default: false
    t.boolean  "campus",                 default: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "student_name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
