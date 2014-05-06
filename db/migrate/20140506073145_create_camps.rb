class CreateCamps < ActiveRecord::Migration
  def change
    create_table :camps do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :name
      t.string :location
      t.datetime :app_start_date
      t.datetime :app_end_date

      t.timestamps
    end
  end
end
