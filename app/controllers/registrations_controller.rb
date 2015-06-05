class RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_admin!, only: [:admin_edit, :admin_update_user]

  def update
    @user = User.find(current_user.id)

    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
    else
      params[:user].delete(:current_password)
      @user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
    end

    if successfully_updated
      set_flash_message :notice, :updated
      sign_in @user, bypass: true
      redirect_to profile_path(@user)
    else
      render "edit"
    end
  end

  def admin_edit
    @user = User.find(params[:id])
  end

  def admin_update_user
    @user = User.find(params[:id])
    if @user.update_without_password(devise_parameter_sanitizer.sanitize(:admin_account_update))
      set_flash_message :notice, :updated
      redirect_to profiles_path
    else
      render "admin_edit"
    end
  end

  private

  def needs_password?(user, params)
      params[:user][:password].present?
  end

end