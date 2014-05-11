class Camp < ActiveRecord::Base

  has_many :events
  has_many :registrations

  accepts_nested_attributes_for :events
end
