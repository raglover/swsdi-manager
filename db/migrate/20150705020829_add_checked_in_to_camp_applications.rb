class AddCheckedInToCampApplications < ActiveRecord::Migration
  def change
    add_column :camp_applications, :checked_in, :boolean, default: false, null: false
  end
end
