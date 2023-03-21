class AddPaymentLinkToCamp < ActiveRecord::Migration
  def change
    add_column :camps, :quikpay_url, :string
  end
end
