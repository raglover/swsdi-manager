class CreateDebateRecords < ActiveRecord::Migration
  def change
    create_table :debate_records do |t|
      t.string :tournament_name
      t.integer :prelim_wins
      t.integer :prelim_losses
      t.boolean :reached_outrounds
      t.string :outround_reached
      t.string :location
      t.string :division

      t.timestamps
    end
  end
end
