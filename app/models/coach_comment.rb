class CoachComment < ActiveRecord::Base
	belongs_to :camp_application
	validates :strengths, presence: true;
	validates :weaknesses, presence: true;
	validates :goals, presence: true;
end
