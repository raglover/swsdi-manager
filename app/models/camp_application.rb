class CampApplication < ActiveRecord::Base

  has_and_belongs_to_many :events
  has_many :debate_records
  has_many :check_out_permissions
  belongs_to :user, :foreign_key => 'user_id'
  belongs_to :camp, :foreign_key => 'camp_id'

  accepts_nested_attributes_for :debate_records, allow_destroy: true
  accepts_nested_attributes_for :check_out_permissions, allow_destroy: true


end
