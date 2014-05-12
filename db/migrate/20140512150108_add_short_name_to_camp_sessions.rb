class AddShortNameToCampSessions < ActiveRecord::Migration
  def change
    add_column :camp_sessions, :shortname, :text
  end
end
