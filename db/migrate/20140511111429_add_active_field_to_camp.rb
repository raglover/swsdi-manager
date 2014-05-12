class AddActiveFieldToCamp < ActiveRecord::Migration
  def change
    add_column :camps, :active, :boolean
  end
end
