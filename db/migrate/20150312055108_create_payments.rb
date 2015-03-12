class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount, precision: 6, scale: 2, null: false
      t.string :type
      t.text :note
      t.timestamps null: false
      t.integer :camp_application_id, null: false, index: true
    end
  end
end
