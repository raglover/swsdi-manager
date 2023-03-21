class AddEventToScholarships < ActiveRecord::Migration
  def change
    add_column :scholarships, :event, :string
  end
end
