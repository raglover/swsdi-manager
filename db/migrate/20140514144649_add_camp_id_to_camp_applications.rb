class AddCampIdToCampApplications < ActiveRecord::Migration
  def change
    add_reference :camp_applications, :camp, index: true
  end
end
