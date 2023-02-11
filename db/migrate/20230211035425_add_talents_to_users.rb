class AddTalentsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :talents, :text
  end
end
