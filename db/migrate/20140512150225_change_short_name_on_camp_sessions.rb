class ChangeShortNameOnCampSessions < ActiveRecord::Migration
  def change
    change_column :camp_sessions, :shortname, :string
  end
end
