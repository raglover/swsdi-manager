class InfoController < ApplicationController
  before_filter :set_camp, only: [:index]

  def index
  end

  def about
  	@staff = AdminProfile.order(last_name: :desc)
  end

  def privacy
  end

  def license
  end

end
