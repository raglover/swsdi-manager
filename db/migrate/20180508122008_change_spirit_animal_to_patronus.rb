class ChangeSpiritAnimalToPatronus < ActiveRecord::Migration
  def change
  	rename_column :admin_profiles, :spirit_animal, :patronus
  	rename_column :users, :spirit_animal, :patronus
  end
end
