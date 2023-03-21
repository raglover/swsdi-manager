class AddPaymentIdToScholarships < ActiveRecord::Migration
  def change
    add_column :scholarships, :payment_id, :integer
  end
end
