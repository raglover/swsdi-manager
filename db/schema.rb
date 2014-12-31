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

ActiveRecord::Schema.define(version: 20141231140547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",                    default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
  end

  add_index "admins", ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true, using: :btree
  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  add_index "admins", ["unlock_token"], name: "index_admins_on_unlock_token", unique: true, using: :btree

  create_table "camp_applications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "camper_type",              limit: 255
    t.string   "event_partner_req",        limit: 255
    t.boolean  "has_competed"
    t.text     "comments"
    t.string   "roommate_req",             limit: 255
    t.boolean  "has_laptop"
    t.boolean  "needs_pickup"
    t.boolean  "needs_dropoff"
    t.text     "itinerary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_allergies"
    t.boolean  "has_dietary_restrictions"
    t.string   "allergies",                limit: 255
    t.string   "dietary_restrictions",     limit: 255
    t.integer  "camp_id"
    t.boolean  "is_approved"
    t.string   "interp_type",              limit: 255
  end

  add_index "camp_applications", ["camp_id"], name: "index_camp_applications_on_camp_id", using: :btree

  create_table "camp_applications_events", id: false, force: :cascade do |t|
    t.integer "camp_application_id", null: false
    t.integer "event_id",            null: false
  end

  add_index "camp_applications_events", ["camp_application_id"], name: "index_camp_applications_events_on_camp_application_id", using: :btree
  add_index "camp_applications_events", ["event_id"], name: "index_camp_applications_events_on_event_id", using: :btree

  create_table "camp_sessions", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.datetime "session_start"
    t.datetime "session_end"
    t.integer  "camp_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shortname",     limit: 255
  end

  add_index "camp_sessions", ["camp_id"], name: "index_camp_sessions_on_camp_id", using: :btree
  add_index "camp_sessions", ["id"], name: "index_camp_sessions_on_id", using: :btree

  create_table "camps", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "name",              limit: 255
    t.string   "location",          limit: 255
    t.datetime "app_start_date"
    t.datetime "app_end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.datetime "discount_deadline"
  end

  create_table "check_out_permissions", force: :cascade do |t|
    t.string   "first_name",          limit: 255
    t.string   "last_name",           limit: 255
    t.string   "relationship",        limit: 255
    t.string   "phone_num",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "camp_application_id"
  end

  add_index "check_out_permissions", ["camp_application_id"], name: "index_check_out_permissions_on_camp_application_id", using: :btree

  create_table "debate_records", force: :cascade do |t|
    t.string   "tournament_name",     limit: 255
    t.integer  "prelim_wins"
    t.integer  "prelim_losses"
    t.boolean  "reached_outrounds"
    t.string   "outround_reached",    limit: 255
    t.string   "location",            limit: 255
    t.string   "division",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "camp_application_id"
  end

  add_index "debate_records", ["camp_application_id"], name: "index_debate_records_on_camp_application_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "price_resident"
    t.integer  "price_commuter"
    t.string   "description",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "camp_id"
    t.integer  "camp_session_id"
  end

  add_index "events", ["camp_id"], name: "index_events_on_camp_id", using: :btree
  add_index "events", ["camp_session_id"], name: "index_events_on_camp_session_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.integer  "camp_id"
    t.string   "building_name", limit: 255
    t.integer  "room_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tenants", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.integer  "length_of_stay"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "image",                  limit: 255
    t.string   "gender",                 limit: 255
    t.string   "address",                limit: 255
    t.string   "school",                 limit: 255
    t.integer  "grade"
    t.string   "phone_number",           limit: 255
    t.string   "parent_first",           limit: 255
    t.string   "parent_last",            limit: 255
    t.string   "parent_relationship",    limit: 255
    t.string   "parent_email",           limit: 255
    t.string   "parent_phone",           limit: 255
    t.string   "tshirt_size",            limit: 255, default: "med"
    t.string   "nickname",               limit: 255
    t.string   "coach_first",            limit: 255
    t.string   "coach_last",             limit: 255
    t.string   "coach_email",            limit: 255
    t.datetime "birthday"
    t.string   "address_line1",          limit: 255
    t.string   "address_line2",          limit: 255
    t.string   "city",                   limit: 255
    t.string   "state",                  limit: 255
    t.integer  "zip"
    t.text     "spirit_animal"
    t.string   "fb_image",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
