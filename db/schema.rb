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

ActiveRecord::Schema.define(version: 20150626015055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.integer  "admin_id"
    t.string   "image"
    t.string   "nickname"
    t.string   "school_affiliation"
    t.string   "spirit_animal"
    t.datetime "birthday"
    t.string   "phone"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "admin_profiles", ["admin_id"], name: "index_admin_profiles_on_admin_id", using: :btree

  create_table "admin_profiles_events", force: :cascade do |t|
    t.integer "admin_profile_id"
    t.integer "event_id"
  end

  add_index "admin_profiles_events", ["admin_profile_id"], name: "index_admin_profiles_events_on_admin_profile_id", using: :btree
  add_index "admin_profiles_events", ["event_id"], name: "index_admin_profiles_events_on_event_id", using: :btree

  create_table "admins", force: :cascade do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "role"
  end

  add_index "admins", ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true, using: :btree
  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  add_index "admins", ["unlock_token"], name: "index_admins_on_unlock_token", unique: true, using: :btree

  create_table "camp_applications", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "camper_type"
    t.string   "event_partner_req"
    t.boolean  "has_competed"
    t.text     "comments"
    t.string   "roommate_req"
    t.boolean  "has_laptop"
    t.boolean  "needs_pickup"
    t.boolean  "needs_dropoff"
    t.text     "itinerary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_allergies"
    t.boolean  "has_dietary_restrictions"
    t.string   "allergies"
    t.string   "dietary_restrictions"
    t.integer  "camp_id"
    t.boolean  "is_approved"
    t.string   "interp_type"
    t.boolean  "med_forms"
    t.boolean  "app_fee"
    t.boolean  "checkout_form"
    t.boolean  "incomplete"
    t.text     "missing_info"
    t.integer  "years_in_event"
    t.integer  "number_of_tournaments"
    t.string   "uuid",                     null: false
  end

  add_index "camp_applications", ["camp_id"], name: "index_camp_applications_on_camp_id", using: :btree

  create_table "camp_applications_events", id: false, force: :cascade do |t|
    t.integer "camp_application_id", null: false
    t.integer "event_id",            null: false
  end

  add_index "camp_applications_events", ["camp_application_id"], name: "index_camp_applications_events_on_camp_application_id", using: :btree
  add_index "camp_applications_events", ["event_id"], name: "index_camp_applications_events_on_event_id", using: :btree

  create_table "camp_sessions", force: :cascade do |t|
    t.string   "name"
    t.datetime "session_start"
    t.datetime "session_end"
    t.integer  "camp_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shortname"
  end

  add_index "camp_sessions", ["camp_id"], name: "index_camp_sessions_on_camp_id", using: :btree
  add_index "camp_sessions", ["id"], name: "index_camp_sessions_on_id", using: :btree

  create_table "camps", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "name"
    t.string   "location"
    t.datetime "app_start_date"
    t.datetime "app_end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.datetime "discount_deadline"
  end

  create_table "check_out_permissions", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "relationship"
    t.string   "phone_num"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "camp_application_id"
  end

  add_index "check_out_permissions", ["camp_application_id"], name: "index_check_out_permissions_on_camp_application_id", using: :btree

  create_table "coach_comments", force: :cascade do |t|
    t.text     "strengths"
    t.text     "weaknesses"
    t.text     "goals"
    t.integer  "camp_application_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "coach_comments", ["camp_application_id"], name: "index_coach_comments_on_camp_application_id", using: :btree

  create_table "debate_records", force: :cascade do |t|
    t.string   "tournament_name"
    t.integer  "prelim_wins"
    t.integer  "prelim_losses"
    t.boolean  "reached_outrounds"
    t.string   "outround_reached"
    t.string   "location"
    t.string   "division"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "camp_application_id"
  end

  add_index "debate_records", ["camp_application_id"], name: "index_debate_records_on_camp_application_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.integer  "price_resident"
    t.integer  "price_commuter"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "camp_id"
    t.integer  "camp_session_id"
    t.string   "event_type"
  end

  add_index "events", ["camp_id"], name: "index_events_on_camp_id", using: :btree
  add_index "events", ["camp_session_id"], name: "index_events_on_camp_session_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.decimal  "amount",              precision: 6, scale: 2, null: false
    t.text     "note"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "camp_application_id",                         null: false
    t.string   "pmt_type"
  end

  add_index "payments", ["camp_application_id"], name: "index_payments_on_camp_application_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.integer  "camp_id"
    t.string   "building_name"
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
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
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
    t.string   "tshirt_size",            default: "med"
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
    t.string   "fb_image"
    t.boolean  "reminder_flag"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
