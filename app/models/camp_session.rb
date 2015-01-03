class CampSession < ActiveRecord::Base

  belongs_to :camp
  has_many :events, dependent: :destroy
  
end
