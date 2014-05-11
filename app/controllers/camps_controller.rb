class CampsController < ApplicationController
  def index
    @camps = Camp.all
  end

  def show
    @camp = Camp.find_by_id
  end

  def new
    @camp = Camp.new
  end

  def create
    Camp.create(camp_params)
  end

  def update
  end

  def destroy
  end

private

  def camp_params
    params.require(:camp).permit(:name, :location, :start_date, :end_date, :app_start_date, :app_end_date, 
      :events_attributes[:name, :start_date, :end_date, :session, :price_resident, :price_commuter, :description])
  end

end
