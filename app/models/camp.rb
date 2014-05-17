class Camp < ActiveRecord::Base

  has_many :events
  has_many :camp_sessions
  has_many :camp_applications

  accepts_nested_attributes_for :camp_sessions, allow_destroy: true
  accepts_nested_attributes_for :events, allow_destroy: true

  scope :active, -> {where( active: true)} 
  scope :registration_open, -> {active.where("app_start_date <= ? <= app_end_date", Time.zone.now)}
end
