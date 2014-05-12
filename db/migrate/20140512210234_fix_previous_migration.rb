class FixPreviousMigration < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.remove :camp_session_id_id
      t.references :camp_sessions
    end
  end
end
