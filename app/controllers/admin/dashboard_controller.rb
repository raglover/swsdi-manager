class Admin::DashboardController < ApplicationController
  
  before_action :authenticate_admin!
  before_filter :set_camp

  def index
  	@user_count = User.all.count
  	@app_count = @camp.camp_applications.count
  	@sessions_count = @camp.session_application_counts.sort
  	@profile = current_admin.admin_profile
    @events = @camp.events
  end

  def event_facebook
    @event = Event.find(params[:id])
    @apps = @event.camp_applications.all
  end

end
