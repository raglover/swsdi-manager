class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :camp_id
      t.string :building_name
      t.integer :room_num

      t.timestamps
    end
  end
end
