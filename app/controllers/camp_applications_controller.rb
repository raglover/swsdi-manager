class CampApplicationsController < ApplicationController
  before_action :set_camp_application, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  
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
    @token = Braintree::ClientToken.generate
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
    user = @camp_application.user
    camp = @camp_application.camp
    RegistrationMailer.student_email(user,camp).deliver_later
    RegistrationMailer.parent_email(user,camp).deliver_later
    RegistrationMailer.admin_email(user,camp).deliver_later

    
    respond_to do |format|
      if @camp_application.save
    	      order = {id: @camp_application.id, applicant_id:  @camp_application.user.id, amount: params[:amount]}
	      if charge_user(order)
		      @camp_application.update_attribute(:app_fee, true)
	              format.html { redirect_to profile_path(current_user), notice: 'Camp application was successfully completed!' }
       		      format.json { render :show, status: :created, location: @camp_application }
	      else
		      format.html { redirect_to new_application_payment_camp_application_path(order), alert:
		      "We have saved your application, but something has gone wrong with processing your credit card.<br/>
		      Please make whatever changes are necessary, and resubmit."
		      }
	      end
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
      format.html { redirect_to profile_path(current_user), notice: 'Camp application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_application_payment
	  @camp_application = CampApplication.find(params[:id])
	  @token = Braintree::ClientToken.generate
  end

  def pay
	  @camp_application = CampApplication.find(params[:id])
	  order = {order_id: @camp_application.id, amount: params[:amount]}
	  transaction = Transaction.new order, params[:payment_method_nonce]
	  transaction.execute
	  if transaction.ok?
		  @camp_application.update_attribute(:app_fee, true)
		  redirect_to profile_path(current_user), notice: 'Thank you for registering for SWSDI!'
	  else
		  render new_application_payment_camp_application_path(order) 
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
        :needs_pickup, :needs_dropoff, :itinerary, :has_allergies, :allergies, :has_dietary_restrictions, :dietary_restrictions, :years_in_event, 
        :number_of_tournaments, :payment_method_nonce, 
        :camp_id, :user_id, :event_ids => [],
        :debate_records_attributes => [:id, :tournament_name, :prelim_wins, :prelim_losses, :reached_outrounds, 
          :outround_reached, :location, :division, :_destroy], 
        :check_out_permissions_attributes => [:id, :first_name, :last_name, :relationship, :phone_num, :_destroy])
    end

    def charge_user(order)
	    transaction = Transaction.new(order, params[:payment_method_nonce])
	    transaction.execute
	    transaction.ok?
    end
end
