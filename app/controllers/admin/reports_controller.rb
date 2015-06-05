class Admin::ReportsController < ApplicationController
  before_filter :set_camp

  def financial
    schools = User.with_apps
                .where('camp_applications.camp_id = ?', @camp.id)
                .where('camp_applications.created_at <= ?', @camp.discount_deadline)
                .group_by{|i| i.school.downcase}
    @schools = schools.sort
  end

  def shuttle
  end

  def status
  end
end
