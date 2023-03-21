class CreateScholarships < ActiveRecord::Migration
  def change
    create_table :scholarships do |t|
      t.references :user, index: true, foreign_key: true
      t.string :tournament
      t.string :round
      t.string :place
      t.boolean :transfer
      t.string :donor_name
      t.string :donor_email
      t.boolean :approved

      t.timestamps null: false
    end
  end
end
