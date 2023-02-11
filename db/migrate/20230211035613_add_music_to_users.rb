class AddMusicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :music, :text
  end
end
