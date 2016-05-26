class Admin::AdminsController < ApplicationController
  def index
    @admins = Admin.all
  end

  def show
    @admins = Admin.all
  end
end
