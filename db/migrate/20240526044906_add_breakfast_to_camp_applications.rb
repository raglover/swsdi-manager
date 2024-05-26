class AddBreakfastToCampApplications < ActiveRecord::Migration
  def change
    add_column :camp_applications, :breakfast, :boolean, default: false
  end
end
