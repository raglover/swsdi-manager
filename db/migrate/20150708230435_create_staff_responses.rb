class CreateStaffResponses < ActiveRecord::Migration
  def change
    create_table :staff_responses do |t|
      t.text :strengths
      t.text :weaknesses
      t.text :goals
      t.text :notes
      t.references :camp_application

      t.timestamps null: false
    end
  end
end
