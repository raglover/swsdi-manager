class AddSpiritAnimalToUser < ActiveRecord::Migration
  def change
    add_column :users, :spirit_animal, :text
  end
end
