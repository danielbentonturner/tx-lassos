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

ActiveRecord::Schema.define(version: 20140911220540) do

  create_table "pendings", force: true do |t|
    t.string   "name"
    t.string   "pledge_class"
    t.string   "pledge_class_name"
    t.string   "grad_year"
    t.string   "major"
    t.string   "street"
    t.string   "city_state"
    t.string   "email"
    t.string   "email2"
    t.string   "phone"
    t.string   "employer"
    t.string   "job_title"
    t.string   "comments"
    t.boolean  "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city_state"
    t.string   "phone"
    t.string   "email"
    t.string   "email2"
    t.string   "major"
    t.string   "pledge_class"
    t.string   "pledge_class_name"
    t.string   "grad_year"
    t.string   "employer"
    t.string   "job_title"
    t.string   "marital_status"
    t.string   "linkedin"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "pinterest"
    t.text     "comments"
    t.boolean  "admin",                  default: false
    t.boolean  "approved",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "",    null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
