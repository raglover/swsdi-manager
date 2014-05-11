class Camp < ActiveRecord::Base

  has_many :events
  has_many :registrations

end
