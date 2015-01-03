class Admin::AdminsController < ApplicationController
  def index
    @admins = Admin.all
  end

  def show
  end
end
