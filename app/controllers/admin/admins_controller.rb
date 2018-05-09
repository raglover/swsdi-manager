class Admin::AdminsController < ApplicationController
  before_filter :set_camp

  def index
    @admins = Admin.all
  end

  def show
    @admins = Admin.all
  end

  def destroy
    @admin = Admin.find_by_id(params[:id])
    @admin.destroy!
    redirect_to admin_admins_path, notice: 'Staff Record was successfully destroyed.'
  end
end