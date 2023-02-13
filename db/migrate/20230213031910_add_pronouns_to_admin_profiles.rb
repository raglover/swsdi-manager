class AddPronounsToAdminProfiles < ActiveRecord::Migration
  def change
    add_column :admin_profiles, :pronouns, :string
  end
end
