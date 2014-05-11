class Event < ActiveRecord::Base

  belongs_to :camp
  has_and_belongs_to_many :camp_applications
end
