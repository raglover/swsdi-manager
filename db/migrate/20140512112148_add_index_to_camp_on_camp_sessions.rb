class AddIndexToCampOnCampSessions < ActiveRecord::Migration
  def change
    add_index :camp_sessions, :camp_id
  end
end
