class CampApplicationsController < ApplicationController
  before_action :set_camp_application, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_admin!, only: [:index]
  
  # GET /camp_applications
  # GET /camp_applications.json
  def index
    @camp_applications = CampApplication.all
  end

  # GET /camp_applications/1
  # GET /camp_applications/1.json
  def show
    @camp = @camp_application.camp
    @user = @camp_application.user
    @debate_records = @camp_application.debate_records.all
    @check_outs = @camp_application.check_out_permissions.all
    if (@user != current_user)
      redirect_to profile_path(current_user), alert: "You are not authorized to view that resource!"
    end
  end

  # GET /camp_applications/new
  def new
    @camp_application = CampApplication.new
    @debate_records = @camp_application.debate_records.build
    @check_outs = @camp_application.check_out_permissions.build
    @camp = Camp.find_by_id( params[:camp_id] )
    @sessions = @camp.camp_sessions.all 
  end

  # GET /camp_applications/1/edit
  def edit
    @debate_records = @camp_application.debate_records.all
    @check_outs = @camp_application.check_out_permissions.all
    @camp = Camp.find_by_id( @camp_application.camp_id )
    @events = @camp_application.events.all
    @sessions = @camp.camp_sessions.all
  end

  # POST /camp_applications
  # POST /camp_applications.json
  def create
    @camp_application = CampApplication.new(camp_application_params)

    respond_to do |format|
      if @camp_application.save
        format.html { redirect_to profile_path(current_user), notice: 'Camp application was successfully completed!' }
        format.json { render :show, status: :created, location: @camp_application }
      else
        format.html { render :new }
        format.json { render json: @camp_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camp_applications/1
  # PATCH/PUT /camp_applications/1.json
  def update
    respond_to do |format|
      if @camp_application.update(camp_application_params)
        format.html { redirect_to profile_path(current_user), notice: 'Camp application was successfully updated!' }
        format.json { render :show, status: :ok, location: @camp_application }
      else
        format.html { render :edit }
        format.json { render json: @camp_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camp_applications/1
  # DELETE /camp_applications/1.json
  def destroy
    @camp_application.destroy
    respond_to do |format|
      format.html { redirect_to camp_applications_url, notice: 'Camp application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camp_application
      @camp_application = CampApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camp_application_params
      params.require(:camp_application).permit(:interp_type, :camper_type, :event_partner_req, :has_competed, :comments, :roommate_req, :has_laptop, 
        :needs_pickup, :needs_dropoff, :itinerary, :has_allergies, :allergies, :has_dietary_restrictions, :dietary_restrictions,
        :camp_id, :user_id, :event_ids => [],
        :debate_records_attributes => [:id, :tournament_name, :prelim_wins, :prelim_losses, :reached_outrounds, 
          :outround_reached, :location, :division, :_destroy], 
        :check_out_permissions_attributes => [:id, :first_name, :last_name, :relationship, :phone_num, :_destroy])
    end
end