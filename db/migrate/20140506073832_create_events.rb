class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :session
      t.integer :price_resident
      t.integer :price_commuter
      t.string :description

      t.timestamps
    end
  end
end
