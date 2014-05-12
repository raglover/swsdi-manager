class FixColumnSessionOnEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.remove :session
      t.string :event_session
    end
  end
end
