class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    case resource
    when User then profile_path(current_user)
    when Admin then admins_index_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:image, :first_name, :last_name, :email, :password, :password_confirmation, 
                  :nickname, :gender, :phone_number, :birthday, :school, :grade, :tshirt_size, :spirit_animal,
                  :address_line1, :address_line2, :city, :state, :zip, :image, :remote_image_url, :image_cache, :fb_image,
                  :parent_first, :parent_last,:parent_phone, :parent_relationship, :parent_email, 
                  :coach_first, :coach_last, :coach_email)}

    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:image, :first_name, :last_name, :email, :password, :password_confirmation, 
                  :current_password, :nickname, :gender, :phone_number, :birthday, :school, :grade, :tshirt_size, :spirit_animal,
                  :address_line1, :address_line2, :city, :state, :zip, :image, :remote_image_url, :image_cache, :fb_image,
                  :parent_first, :parent_last,:parent_phone, :parent_relationship, :parent_email, 
                  :coach_first, :coach_last, :coach_email)}
  end
end
