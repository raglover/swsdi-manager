class Admin::StaffResponsesController < ApplicationController
  before_filter :authenticate_admin!
  before_action :set_camp_app

  def show
    @response = @camp_app.staff_response
  end

  def new
    @response = StaffResponse.new
  end

  def create
    @response = StaffResponse.new(staff_response_params)
    @response.camp_application_id = @camp_app.id
    respond_to do |format|
      if @response.save
        format.html { redirect_to(admin_camp_application_path(@camp_app), notice: 'Evaluation was successfully added!')}
      else
        format.html { render action: "new", alert: 'There was a problem saving this Evaluation.' }
      end
    end  
  end

  def edit
    @response = @camp_app.staff_response
  end

  def update
    @response = @camp_app.staff_response
    respond_to do |format|
      if @response.update_attributes(staff_response_params)
        format.html { redirect_to(admin_camp_application_path(@camp_app), notice: 'Evaluation was successfully updated!')}
      else
        fomat.html { render action: "edit", alert: 'There was a problem saving this Evaluation' }
      end
    end
  end

  def destroy
    @response = @camp_app.staff_response
    @response.destroy
    respond_to do |format|
      format.html { redirect_to(admin_camp_application_path(@camp_app), notice: "Evaluation successfully deleted!") }
    end    
  end

  def send_notification
    if @camp_app.user.coach_email && @camp_app.staff_response
      EvaluationMailer.student_evaluation(@camp_app.user.coach_email, @camp_app).deliver_later
      redirect_to(admin_camp_application_path(@camp_app), notice: 'Evaluation sent to coach!')
    elsif @camp_app.user.parent_email && @camp_app.staff_response
      EvaluationMailer.student_evaluation(@camp_app.user.parent_email, @camp_app).deliver_later
      redirect_to(admin_camp_application_path(@camp_app), notice: 'Evaluation sent to parent!')
    else
      redirect_to(admin_camp_application_path(@camp_app), alert: 'Evaluation could not be sent!')
    end
  end

  private

    def set_camp_app
      @camp_app = CampApplication.find(params[:camp_application_id])
    end

    def staff_response_params
      params.require(:staff_response).permit(:strengths, :weaknesses, :goals, :notes)
    end

end