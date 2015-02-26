class CreateAdminprofilesEvents < ActiveRecord::Migration
  def change
    create_table :admin_profiles_events do |t|
      t.integer :admin_profile_id
      t.integer :event_id
    end
    add_index :admin_profiles_events, :admin_profile_id
    add_index :admin_profiles_events, :event_id
  end
end
