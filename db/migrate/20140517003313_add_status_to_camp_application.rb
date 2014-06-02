class AddStatusToCampApplication < ActiveRecord::Migration
  def change
    add_column :camp_applications, :is_approved, :boolean
  end
end
