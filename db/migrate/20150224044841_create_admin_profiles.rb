class CreateAdminProfiles < ActiveRecord::Migration
  def change
    create_table :admin_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.integer :admin_id
      t.string :image
      t.string :nickname
      t.string :school_affiliation
      t.string :spirit_animal
      t.datetime :birthday
      t.string :phone
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
    add_index :admin_profiles, :admin_id
  end
end
