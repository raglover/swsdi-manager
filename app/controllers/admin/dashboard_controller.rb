class Admin::DashboardController < ApplicationController
  
  before_action :authenticate_admin!

  def index
  	@camp = Camp.registration_open.first
  	@user_count = User.all.count
  	@app_count = @camp.camp_applications.count
  	@sessions_count = @camp.session_application_counts.sort
  end

end
