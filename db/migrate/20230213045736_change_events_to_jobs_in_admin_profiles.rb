class ChangeEventsToJobsInAdminProfiles < ActiveRecord::Migration
  def change
    rename_column :admin_profiles, :events, :jobs
  end
end
