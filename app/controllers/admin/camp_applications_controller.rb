class Admin::CampApplicationsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@camp = Camp.registration_open.first
		@camp_apps = @camp.camp_applications
    	@index_page = true
	end

	def show
		@camp_app = CampApplication.find_by_id(params[:id])
		@user = @camp_app.user
    @tuition = CalculateTuition.new(@camp_app)
    @payments = @camp_app.payments
	end

	def edit
		@camp_app = CampApplication.find_by_id(params[:id])
		@debate_records = @camp_app.debate_records.all
    	@check_outs = @camp_app.check_out_permissions.all
    	@camp = Camp.find_by_id( @camp_app.camp_id )
    	@events = @camp_app.events.all
    	@sessions = @camp.camp_sessions.all
	end

	def update
	  @camp_app = CampApplication.find_by_id(params[:id])
	  respond_to do |format|
      if @camp_app.update(camp_application_params)
        if @camp_app.is_approved
          RegistrationMailer.verification_email(@camp_app.user, @camp_app.camp, @camp_app).deliver_later
        end
        format.html { redirect_to admin_camp_app_path(@camp_app), notice: 'Camp application was successfully updated!' }
        format.json { render :show, status: :ok, location: @camp_app }
      else
        format.html { render :edit }
        format.json { render json: @camp_app.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
	end

	private

		def camp_application_params
			params.require(:camp_application).permit(:interp_type, :camper_type, :event_partner_req, :has_competed, :comments, :roommate_req, :has_laptop, 
	        	:needs_pickup, :needs_dropoff, :itinerary, :has_allergies, :allergies, :has_dietary_restrictions, :dietary_restrictions, :is_approved, 
	        	:med_forms, :app_fee, :checkout_form, :incomplete, :missing_info, :years_in_event, :number_of_tournaments,
	        	:camp_id, :user_id, :event_ids => [],
	        	:debate_records_attributes => [:id, :tournament_name, :prelim_wins, :prelim_losses, :reached_outrounds, 
	          	:outround_reached, :location, :division, :_destroy], 
	        	:check_out_permissions_attributes => [:id, :first_name, :last_name, :relationship, :phone_num, :_destroy])
		end
end