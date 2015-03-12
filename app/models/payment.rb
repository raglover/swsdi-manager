class Payment < ActiveRecord::Base
  belongs_to :camp_application, :foreign_key => 'camp_applications_id'
end
