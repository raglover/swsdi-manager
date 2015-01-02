class Admin::CampAppsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@camp = Camp.registration_open.first
		@camp_apps = @camp.camp_applications
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

		def camp_application_params
			params.require(:camp_application).permit(:interp_type, :camper_type, :event_partner_req, :has_competed, :comments, :roommate_req, :has_laptop, 
	        	:needs_pickup, :needs_dropoff, :itinerary, :has_allergies, :allergies, :has_dietary_restrictions, :dietary_restrictions, :is_approved, 
	        	:med_forms, :app_fee, :checkout_form, :incomplete, :missing_info,
	        	:camp_id, :user_id, :event_ids => [],
	        	:debate_records_attributes => [:id, :tournament_name, :prelim_wins, :prelim_losses, :reached_outrounds, 
	          	:outround_reached, :location, :division, :_destroy], 
	        	:check_out_permissions_attributes => [:id, :first_name, :last_name, :relationship, :phone_num, :_destroy])
		end
end