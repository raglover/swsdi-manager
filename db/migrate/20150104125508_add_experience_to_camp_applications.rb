class AddExperienceToCampApplications < ActiveRecord::Migration
  def change
    add_column :camp_applications, :years_in_event, :integer
    add_column :camp_applications, :number_of_tournaments, :integer
  end
end
