class Admin::ReportsController < ApplicationController
  before_filter :set_camp
  before_action :authenticate_admin!

  def financial
    schools = User.with_apps
                .where('camp_applications.camp_id = ?', @camp.id)
                .where('camp_applications.created_at <= ?', @camp.discount_deadline)
                .group_by{|i| i.school.downcase}
    @schools = schools.sort
    @totals = FinancialReport.new(@camp)
    @students = @camp.camp_applications.includes(:user).order("users.last_name")
    authorize :report, :financial?
  end

  def shuttle
    @students = User.with_apps
                    .where('camp_applications.camp_id = ?', @camp.id)
                    .where('camp_applications.needs_pickup = ? OR camp_applications.needs_dropoff = ?', true, true)
    authorize :report, :show?
  end

  def status
    @residents = User.with_apps
                     .where('camp_applications.camp_id = ?', @camp.id)    
                     .where('camp_applications.camper_type = ?', "Resident")
                     .order(:gender, :grade, :school)
    @commuters = User.with_apps
                     .where('camp_applications.camp_id = ?', @camp.id)
                     .where('camp_applications.camper_type = ?', "Commuter")
    authorize :report, :show?
  end

  def registration
    @events = @camp.events
    authorize :report, :registration?
  end

  def nametags
    @students = User.with_apps.where('camp_applications.camp_id = ?', @camp.id)
    authorize :report, :financial?
  end
end
