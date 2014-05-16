class ChangeColumnTypeOfDietaryRestrictionsOnCampApplications < ActiveRecord::Migration
  def change
    change_column :camp_applications, :dietary_restrictions, :string
  end
end
