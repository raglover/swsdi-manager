class InfoController < ApplicationController
  before_filter :set_camp, only: [:index]

  def index
  end

  def about
    @board = Admin.board
    @counselors = Admin.counselors
  end

  def privacy
  end

  def license
  end

end
