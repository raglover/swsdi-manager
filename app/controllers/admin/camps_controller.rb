class Admin::CampsController < ApplicationController
  before_action :set_camp, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  
  def index
    @camps = Camp.all
    authorize @camps
  end

  def show
    @events = @camp.events.all
  end

  def new
    @camp = Camp.new
    @csession = @camp.camp_sessions.build
    authorize @camp
  end

  def edit
    @events = @camp.events.all ||= @camp.events.build
    @csessions = @camp.camp_sessions.all 
  end
  
  def create
    @camp = Camp.new(camp_params)
    authorize @camp
    if @camp.save
      flash[:notice] = "A New Camp has been created sucessfully!"
      redirect_to [:admin, @camp]
    else
      render :new
    end
  end

  def update
    @events = @camp.events.all
    @csessions = @camp.camp_sessions.all
    if @camp.update(camp_params)
      flash[:notice] = "Camp updated successfully!"
      redirect_to [:admin, @camp]
    else
      render :edit
    end
  end

  def destroy
    @camp.destroy
    redirect_to admin_camp_url, notice: 'Camp was successfully destroyed'
  end

private

  def set_camp
    @camp = Camp.find(params[:id])
    authorize @camp
  end

  def camp_params
    params.require(:camp).permit(:name, :location, :quikpay_url, :start_date, :end_date, :app_start_date, :app_end_date, :discount_deadline, :active,
      :camp_sessions_attributes => [:id, :name, :shortname, :session_start, :session_end, '_destroy'],
      :events_attributes => [:id, :name, :start_date, :end_date, :camp_session_id, :price_resident, :price_commuter, :description, :camp_id, :event_type, '_destroy'])
  end

end
