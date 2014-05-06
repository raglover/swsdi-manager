class AddRegistrationToCheckOutPermission < ActiveRecord::Migration
  def change
    add_column :check_out_permissions, :registration_id, :integer
  end
end
