class ChangeTypeFromPayments < ActiveRecord::Migration
  def change
    remove_column :payments, :type, :string
    add_column :payments, :pmt_type, :string
  end
end
