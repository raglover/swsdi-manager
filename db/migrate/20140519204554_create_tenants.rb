class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.integer :user_id
      t.integer :room_id
      t.integer :length_of_stay

      t.timestamps
    end
  end
end
