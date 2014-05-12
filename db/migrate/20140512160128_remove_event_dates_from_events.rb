class RemoveEventDatesFromEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.remove :start_date, :end_date
    end
  end
end
