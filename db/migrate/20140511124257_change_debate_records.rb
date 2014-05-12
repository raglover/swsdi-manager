class ChangeDebateRecords < ActiveRecord::Migration
  def change
    change_table :debate_records do |t|
      t.remove :registration_id
      t.references :camp_application
    end
    add_index :debate_records, :camp_application_id
  end
end
