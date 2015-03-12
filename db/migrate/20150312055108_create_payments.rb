class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount, precision: 6, scale: 2, null: false
      t.string :type
      t.text :note
      t.timestamps null: false
    end
    add_reference :payments, :camp_applications, index: true
  end
end
