class Payment < ActiveRecord::Base
  belongs_to :camp_application, :foreign_key => 'camp_applications_id'
  validates :amount, presence: true, numericality: true
  validates :pmt_type, presence: true
  validates :note, presence: true
  attr_accessor :first_name, :last_name # Virtual Attrs for Braintree Txn
end
