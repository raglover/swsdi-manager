class InfoController < ApplicationController
  def index
    @camp = Camp.registration_open.first
  end

  def about
  end

  def privacy
  end

  def license
  end
end
