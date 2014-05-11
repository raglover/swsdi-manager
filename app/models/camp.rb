class Camp < ActiveRecord::Base

  has_many :events
  has_many :registrations, :foreign_key => 'camp_id'

  accepts_nested_attributes_for :events
end
