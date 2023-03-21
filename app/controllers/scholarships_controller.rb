class ScholarshipsController < ApplicationController
  before_action :set_scholarship, only: [:show, :edit, :update, :destroy]
  before_action :set_camp
  before_action :set_camp_app, only: [:new, :create]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :authenticate_admin!, only: [:index, :edit, :update, :destroy]

  # GET /scholarships
  # GET /scholarships.json
  def index
    @approved_scholarships = Scholarship.joins(:camp_application).where(camp_applications: {camp_id: @camp.id}, approved: true)
    @unapproved_scholarships = Scholarship.joins(:camp_application).where(camp_applications: { camp_id: @camp.id }).where('approved = ? OR approved IS NULL', false)

  end

  # GET /scholarships/new
  def new
    @scholarship = Scholarship.new
  end

  # GET /scholarships/1/edit
  def edit
  end

  # POST /scholarships
  # POST /scholarships.json
  def create
    @scholarship = Scholarship.new(scholarship_params)

    respond_to do |format|
      if @scholarship.save
        format.html { redirect_to new_scholarship_path, notice: 'Scholarship Claim Submitted Successfully.' }
        format.json { render :show, status: :created, location: @scholarship }
      else
        format.html { render :new }
        format.json { render json: @scholarship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scholarships/1
  # PATCH/PUT /scholarships/1.json
  def update
    respond_to do |format|
      if @scholarship.update(scholarship_params)
        format.html { redirect_to scholarships_url, notice: 'Scholarship was successfully updated.' }
        format.json { render :show, status: :ok, location: @scholarship }
      else
        format.html { render :edit }
        format.json { render json: @scholarship.errors, status: :unprocessable_entity }
      end
    end
  end

  def toggle_approval
    @scholarship = Scholarship.find(params[:id])
    @scholarship.update_attribute(:approved, !@scholarship.approved)
    respond_to do |format|
      format.js
    end
  end

  # DELETE /scholarships/1
  # DELETE /scholarships/1.json
  def destroy
    @scholarship.destroy
    respond_to do |format|
      format.html { redirect_to scholarships_url, notice: 'Scholarship was successfully cancelled.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scholarship
      @scholarship = Scholarship.find(params[:id])
    end

    def set_camp_app
      @camp_app = current_user.camp_applications.where(camp_id: @camp.id).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scholarship_params
      params.require(:scholarship).permit(:user_id, :tournament, :state, :url, :round, :event, :place, :transfer, :donor_name, :donor_email, :camp_application_id, :approved)
    end
end
