class CreateCampApplication < ActiveRecord::Migration
  def change
    create_table :camp_applications do |t|
      t.references :user
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
      t.text     "dietary_restrictions"
    end
  end
end
