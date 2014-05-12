class CampSession < ActiveRecord::Base

  belongs_to :camp
  has_many :events
  
end
