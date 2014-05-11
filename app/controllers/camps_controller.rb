class CampsController < ApplicationController
  def index
    @camps = Camp.all
  end

  def show
    @camp = Camp.find_by_id(params[:id])
  end

  def new
    @camp = Camp.new
  end

  def create
    @camp = Camp.create(camp_params)
    if @camp.save
      flash[:notice] = "A New Camp has been created sucessfully!"
      redirect_to @camp
    else
      render :action => 'new'
    end
  end

  def update
    @camp = Camp.find_by_id
    if @camp.update(camp_params)
      flash[:notice] = "Camp updated successfully!"
      redirect_to @camp
    else
      render :action=> 'edit'
    end
  end

  def destroy
  end

private

  def camp_params
    params.require(:camp).permit(:name, :location, :start_date, :end_date, :app_start_date, :app_end_date, :active,
      :events_attributes[:name, :start_date, :end_date, :session, :price_resident, :price_commuter, :description])
  end

end
