class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, 
                  :nickname, :gender, :phone_number, :birthday, :school, :grade, :tshirt_size, 
                  :address_line1, :address_line2, :city, :state, :zip, 
                  :parent_first, :parent_last,:parent_phone, :parent_relationship, :parent_email, 
                  :coach_first, :coach_last, :coach_email)}
  end
end
