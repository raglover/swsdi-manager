class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :set_camp

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

    def after_sign_in_path_for(resource)
      case resource
      when User then profile_path(current_user)
      when Admin then 
        if current_admin.admin_profile
          admin_dashboard_index_path
        else
          new_admin_admin_profile_path
        end
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:image, :first_name, :last_name, :email, :password, :password_confirmation, 
                    :nickname, :gender, :pronouns, :phone_number, :birthday, :school, :grade, :tshirt_size,
                    :address_line1, :address_line2, :city, :state, :zip, :image, :remote_image_url, :image_cache, :fb_image,
                    :parent_first, :parent_last,:parent_phone, :parent_relationship, :parent_email, 
                    :coach_first, :coach_last, :coach_email, :talents, :music])

      devise_parameter_sanitizer.permit(:account_update, keys: [:image, :first_name, :last_name, :email, :password, :password_confirmation, 
                    :current_password, :nickname, :gender, :pronouns, :phone_number, :birthday, :school, :grade, :tshirt_size,
                    :address_line1, :address_line2, :city, :state, :zip, :image, :remote_image_url, :image_cache, :fb_image,
                    :parent_first, :parent_last,:parent_phone, :parent_relationship, :parent_email, 
                    :coach_first, :coach_last, :coach_email, :talents, :music])

      devise_parameter_sanitizer.permit(:admin_account_update, keys: [:first_name, :last_name, :email, :nickname, :gender, :pronouns, 
                    :phone_number, :birthday, :school, :grade, :tshirt_size, :address_line1, :address_line2, :city, 
                    :state, :zip, :parent_first, :parent_last,:parent_phone, :parent_relationship, :parent_email, 
                    :coach_first, :coach_last, :coach_email, :talents, :music])
      
      devise_parameter_sanitizer.permit(:invite, keys: [:email, :role])
    end

  private
  
    def set_camp
      open = Camp.registration_open
      closed = Camp.registration_closed
      if !open.empty?
        @camp = open.first
      elsif !closed.empty?
        @camp = closed.first
      end
    end

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action!"
      redirect_to(request.referrer || root_path)
    end

    def pundit_user
      current_admin
    end

end
