class AddPronounsToUser < ActiveRecord::Migration
  def change
    add_column :users, :pronouns, :string
  end
end
