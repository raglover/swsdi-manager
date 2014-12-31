class AddDiscountDeadlineToCamps < ActiveRecord::Migration
  def change
    add_column :camps, :discount_deadline, :datetime
  end
end
