class Registration < ActiveRecord::Base

  has_many :debate_records
  has_many :check_out_permissions
  belongs_to :user, :foreign_key => 'user_id'
  belongs_to :camp, :foreign_key => 'camp_id'

end
