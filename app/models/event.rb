class Event < ActiveRecord::Base

  belongs_to :camp
  belongs_to :camp_session
  has_and_belongs_to_many :camp_applications

  scope :debate_events, -> { where( 'event_type = ?', 'debate' ) }
  scope :event_names, -> { pluck(:name) }
  
end
