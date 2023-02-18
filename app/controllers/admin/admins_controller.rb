class Admin::AdminsController < ApplicationController
  before_filter :set_camp
  before_action :authenticate_admin!

  def index
    @admins = Admin.all
  end

  def show
    @admins = Admin.all
  end

  def edit
  end

  def update
    @admin = Admin.find(params[:id])
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to admin_admins_path, notice: "Admin Role successfully updated!" }
        format.json { render :index, status: :ok, location: admin_admins_path }
      else
        format.html { render :edit, alert: "There was a problem updating the record." }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin = Admin.find_by_id(params[:id])
    @admin.destroy!
    redirect_to admin_admins_path, notice: 'Staff Record was successfully destroyed.'
  end

  private

    def admin_params
      params.require(:admin).permit(:role)
    end
end