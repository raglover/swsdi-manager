class Admin::AdminProfilesController < ApplicationController
	before_action :authenticate_admin!
  	before_filter :set_camp
	before_action :set_admin_profile, only: [:edit, :update, :destroy]

  	def index
    	@admins = AdminProfile.all.order(:last_name)
  	end

	def new
		@profile = AdminProfile.new
		@admin = current_admin
	end

	def edit
		@admins = current_admin
	end

	def create
		@profile = AdminProfile.new(admin_profile_params)
		@profile.admin_id = current_admin.id
		respond_to do |format|
			if @profile.save
				format.html { redirect_to admin_dashboard_index_path, notice: 'Your Profile has been Created!' }
			else
				format.html { render :new }
			end
		end
	end

	def update
	  respond_to do |format|
      	if @profile.update(admin_profile_params)
        	format.html { redirect_to admin_dashboard_index_path, notice: 'Profile was successfully updated!' }
        	format.json { render :show, status: :ok, location: @profile }
      	else
        	format.html { render :edit }
        	format.json { render json: @profile.errors, status: :unprocessable_entity }
      	end
      end
	end

	def destroy
		@profile.destroy
    	respond_to do |format|
      		format.html { redirect_to admin_dashboard_index_path, notice: 'Admin Profile was successfully destroyed.' }
      		format.json { head :no_content }
    	end
	end

	private

		def set_admin_profile
			@profile = AdminProfile.find_by_id(params[:id])
		end

		def admin_profile_params
			params.require(:admin_profile).permit(:image, :first_name, :last_name,
				:nickname, :bio, :admin_id, :school_affiliation,
				:birthday, :phone, :address_line1, :address_line2, :city, :state,
				:zip)
		end

end