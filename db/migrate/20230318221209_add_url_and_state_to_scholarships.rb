class AddUrlAndStateToScholarships < ActiveRecord::Migration
  def change
    add_column :scholarships, :url, :string
    add_column :scholarships, :state, :string
  end
end
