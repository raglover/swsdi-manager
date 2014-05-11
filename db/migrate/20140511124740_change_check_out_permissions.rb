class ChangeCheckOutPermissions < ActiveRecord::Migration
  def change
    change_table :check_out_permissions do |t|
      t.remove :registration_id
      t.references :camp_application
    end
    add_index :check_out_permissions, :camp_application_id
  end
end
