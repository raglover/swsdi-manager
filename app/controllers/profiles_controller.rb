class ProfilesController < ApplicationController
  before_action :authenticate_admin!, :only => [:index, :send_reminder_email]
  before_action :authenticate_user!, :only => [:show]
  before_action :set_camp, only: [:index]

  def index
    @search = User.ransack(params[:q])
    @users = @search.result.includes(:camp_applications).order(:school)
  end

  def show
    @camps = Camp.registration_open
    if User.find_by_id(params[:id]) != current_user
      redirect_to root_path, alert: "You are not authorized to view that resource!"
    else
      @user = current_user
    end
  end

  def send_reminder_email
    user = User.find(params[:id])
    camp = Camp.registration_open.first
    RegistrationMailer.reminder_email(user, camp).deliver_now
    user.reminder_flag = true
    respond_to do |format|
      if user.save!
        format.html { redirect_to profiles_path, notice: 'Reminder email sent!' }
      else
        format.html { redirect_to profiles_path, alert: 'Problem sending email! Maybe do it manually?'}
      end
    end
  end

end
