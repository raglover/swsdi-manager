class CampsController < ApplicationController
  before_action :set_camp, only: [:show, :edit, :update, :destroy]

  def index
    @camps = Camp.all
  end

  def show
    @events = @camp.events.all.order(:event_session)
  end

  def new
    @camp = Camp.new
    @events = @camp.events.build
    @csession = @camp.camp_sessions.build
  end

  def edit
    @events = @camp.events.all
    @csession = @camp.camp_sessions.all ||= @camp.camp_sessions.build
  end
  
  def create
    @camp = Camp.new(camp_params)

    if @camp.save
      flash[:notice] = "A New Camp has been created sucessfully!"
      redirect_to @camp
    else
      render :new
    end
  end

  def update
    @events = @camp.events.all
    @csession = @camp.camp_sessions.all
    if @camp.update(camp_params)
      flash[:notice] = "Camp updated successfully!"
      redirect_to @camp
    else
      render :edit
    end
  end

  def destroy
    @camp.destroy
    redirect_to camp_url, notice: 'Camp was successfully destroyed'
  end

private

  def set_camp
    @camp = Camp.find(params[:id])
  end

  def camp_params
    params.require(:camp).permit(:name, :location, :start_date, :end_date, :app_start_date, :app_end_date, :active,
      :camp_sessions_attributes => [:id, :name, :shortname, :session_start, :session_end, '_destroy'],
      :events_attributes => [:id, :name, :start_date, :end_date, :event_session, :price_resident, :price_commuter, :description, :camp_id, '_destroy'])
  end

end
