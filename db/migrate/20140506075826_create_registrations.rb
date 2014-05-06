class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :camper_type
      t.string :event_id
      t.string :event_partner_req
      t.boolean :has_competed
      t.string :comments
      t.string :roommate_req
      t.boolean :has_laptop
      t.boolean :needs_pickup
      t.boolean :needs_dropoff
      t.string :itinerary

      t.timestamps
    end
  end
end
