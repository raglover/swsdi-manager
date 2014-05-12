class CreateCampSessions < ActiveRecord::Migration
  def change
    create_table :camp_sessions do |t|
      t.string :name
      t.datetime :session_start
      t.datetime :session_end
      t.references :camp

      t.timestamps
    end
    add_index :camp_sessions, :id
  end
end
