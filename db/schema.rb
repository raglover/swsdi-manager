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

ActiveRecord::Schema.define(version: 20140511004410) do

  create_table "admins", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "camps", force: true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "name"
    t.string   "location"
    t.datetime "app_start_date"
    t.datetime "app_end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "check_out_permissions", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "relationship"
    t.string   "phone_num"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "registration_id"
  end

  create_table "debate_records", force: true do |t|
    t.string   "tournament_name"
    t.integer  "prelim_wins"
    t.integer  "prelim_losses"
    t.boolean  "reached_outrounds"
    t.string   "outround_reached"
    t.string   "location"
    t.string   "division"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "registration_id"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "session"
    t.integer  "price_resident"
    t.integer  "price_commuter"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "camp_id"
  end

  add_index "events", ["camp_id"], name: "index_events_on_camp_id"

  create_table "registrations", force: true do |t|
    t.string   "camper_type"
    t.string   "event_id"
    t.string   "event_partner_req"
    t.boolean  "has_competed"
    t.string   "comments"
    t.string   "roommate_req"
    t.boolean  "has_laptop"
    t.boolean  "needs_pickup"
    t.boolean  "needs_dropoff"
    t.string   "itinerary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_allergies"
    t.boolean  "has_dietary_restrictions"
    t.string   "allergies"
    t.string   "dietary_restrictions"
  end

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.string   "gender"
    t.string   "address"
    t.string   "school"
    t.integer  "grade"
    t.string   "phone_number"
    t.string   "parent_first"
    t.string   "parent_last"
    t.string   "parent_relationship"
    t.string   "parent_email"
    t.string   "parent_phone"
    t.string   "tshirt_size"
    t.string   "nickname"
    t.string   "coach_first"
    t.string   "coach_last"
    t.string   "coach_email"
    t.datetime "birthday"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.text     "spirit_animal"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
