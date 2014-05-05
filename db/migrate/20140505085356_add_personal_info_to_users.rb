class AddPersonalInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :school, :string
    add_column :users, :grade, :integer
    add_column :users, :phone_number, :string
    add_column :users, :parent_first, :string
    add_column :users, :parent_last, :string
    add_column :users, :parent_relationship, :string
    add_column :users, :parent_email, :string
    add_column :users, :parent_phone, :string
    add_column :users, :tshirt_size, :string
    add_column :users, :nickname, :string
    add_column :users, :coach_first, :string
    add_column :users, :coach_last, :string
    add_column :users, :coach_email, :string
  end
end
