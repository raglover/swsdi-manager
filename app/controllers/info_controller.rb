class InfoController < ApplicationController
  def index
    @camp = Camp.registration_open.first
  end

  def about
  	@staff = AdminProfile.all
  end

  def privacy
  end

  def license
  end

end
