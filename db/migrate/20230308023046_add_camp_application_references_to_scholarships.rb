class AddCampApplicationReferencesToScholarships < ActiveRecord::Migration
  def change
    add_column :scholarships, :camp_application_id, :integer, index: true, foreign_key: true
  end
end
