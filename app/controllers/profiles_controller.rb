class ProfilesController < ApplicationController
  before_action :authenticate_admin!, only: :index
  before_action :authenticate_user!, only: :show

  def index
    @users = User.all
  end

  def show
    @camps = Camp.registration_open
    if User.find_by_id(params[:id]) != current_user
      redirect_to root_path, alert: "You are not authorized to view that resource!"
    else
      @user = current_user
    end
  end

end
