class AddEventsToAdminProfiles < ActiveRecord::Migration
  def change
    add_column :admin_profiles, :events, :string
  end
end
