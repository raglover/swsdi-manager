class ChangeSessionInfoOnEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.remove :event_session
      t.references :camp_session_id
    end
  end
end
