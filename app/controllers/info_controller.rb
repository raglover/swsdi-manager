class InfoController < ApplicationController
  def index
    @camp = Camp.where(active: true).first
  end

  def about
  end

  def privacy
  end

  def license
  end
end
