class CreateCheckOutPermissions < ActiveRecord::Migration
  def change
    create_table :check_out_permissions do |t|
      t.string :first_name
      t.string :last_name
      t.string :relationship
      t.string :phone_num

      t.timestamps
    end
  end
end
