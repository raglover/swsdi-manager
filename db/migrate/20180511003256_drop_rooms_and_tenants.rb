class DropRoomsAndTenants < ActiveRecord::Migration
  def change
  	drop_table :rooms
  	drop_table :tenants
  end
end
