class ProfilesController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @camps = Camp.registration_open
    if params[:id].nil?
      @user = current_user
    else
      @user = User.find params[:id]
    end
  end
end
