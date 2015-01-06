class CoachCommentsController < ApplicationController
  def new
  	@camp_app = CampApplication.where(uuid: params[:id]).first
  	@coach_comment = CoachComment.new
  end

  def create
  	comment = params[:coach_comment]
  	@camp_app = CampApplication.where(uuid: comment[:app_id]).first
  	@coach_comment = CoachComment.new(coach_comment_params)
  	@coach_comment.camp_application_id = @camp_app.id

  	respond_to do |format|
  	  if @coach_comment.save
 		format.html { redirect_to root_path, notice: 'Thank you for your comments!' }
      else
        format.html { render :new }
      end
  	end
  end

private
	
	def coach_comment_params
		params.require(:coach_comment).permit(:strengths, :weaknesses, :goals)
	end

end
