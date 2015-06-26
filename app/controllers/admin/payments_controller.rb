class Admin::PaymentsController < ApplicationController
  before_action :set_camp_app
  before_action :set_camp, only: [:index, :show]
  before_action :authenticate_admin!

  def index
    @payments = @camp_app.payments
    @tuition = CalculateTuition.new(@camp_app)
    authorize @payments
  end

  def new
    @payment = @camp_app.payments.build
    authorize @payment
  end

  def edit
    @payment = @camp_app.payments.find(params[:id])
    authorize @payment
  end

  def create
    @payment = @camp_app.payments.create(payment_params)
    authorize @payment
    respond_to do |format|
      if @payment.save
        format.html { redirect_to(admin_camp_application_payments_path(@camp_app), notice: 'Payment was successfully added!')}
      else
        format.html { render action: "new", alert: 'There was a problem saving this payment.' }
      end
    end
  end

  def update
    @payment = @camp_app.payments.find(params[:id])
    authorize @payment
    respond_to do |format|
      if @payment.update_attributes(payment_params)
        format.html { redirect_to(admin_camp_application_payments_path(@camp_app), notice: "Payment successfully updated!")}
      else
        format.html { render action: "edit", alert: "There was a problem saving this payment." }
      end
    end
  end

  def destroy
    @payment = @camp_app.payments.find(params[:id])
    authorize @payment
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to(admin_camp_application_payments_path(@camp_app), notice: "Payment successfully deleted!") }
    end
  end

  private
    def set_camp_app
      @camp_app = CampApplication.find(params[:camp_application_id])
    end

    def payment_params
      params.require(:payment).permit(:amount, :pmt_type, :note)
    end

    def pundit_user
      current_admin
    end

end