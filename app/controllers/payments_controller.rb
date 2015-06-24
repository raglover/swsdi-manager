class PaymentsController < ApplicationController
  before_action :set_camp_app
  before_action :set_camp, only: [:index]
  before_action :authenticate_user!

  def index
    @payments = @camp_app.payments
    @tuition = CalculateTuition.new(@camp_app)
  end

  private
    def set_camp_app
      @camp_app = current_user.camp_applications.first
    end

end