class CampApplicationsEvents < ActiveRecord::Base

  belongs_to :camp_applications
  belongs_to :events

end