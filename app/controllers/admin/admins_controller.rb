class Admin::AdminsController < ApplicationController
  def index
    @admins = Admin.all
  end

  def show
    @admins = Admin.all
  end

  def destroy
    @admin = Admin.find_by_id(params[:id])
    @admin.destroy!
    redirect_to admin_admins_index_path, notice: 'Application was successfully destroyed.'
  end
end
