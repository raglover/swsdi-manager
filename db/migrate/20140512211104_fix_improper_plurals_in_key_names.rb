class FixImproperPluralsInKeyNames < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.remove :camp_sessions_id
      t.references :camp_session
    end
    add_index :events, :camp_session_id
  end
end
