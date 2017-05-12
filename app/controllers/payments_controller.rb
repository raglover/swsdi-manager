class PaymentsController < ApplicationController
  before_action :set_camp
  before_action :set_camp_app
  before_action :authenticate_user!

  def index
    @payments = @camp_app.payments
    @tuition = CalculateTuition.new(@camp_app)
    @new_payment = @camp_app.payments.build
    @token = Braintree::ClientToken.generate
  end

  def create
    @payment = @camp_app.payments.build(payment_params)
    respond_to do |format|
      order = {id: @camp_app.id, applicant_id: current_user.id, amount: params[:payment][:amount]}
      transaction = Transaction.new(order, params[:payment_method_nonce])
      transaction.execute
      if transaction.ok?
          if @payment.save
              format.html { redirect_to profile_path(current_user), notice: 'Thank you for your payment!' }
          else
              format.html {  redirect_to profile_path(current_user), alert: 'Something has gone wrong with saving the payment you made. Please contact info@swsdi.org' }
          end
      else
          format.html { redirect_to profile_path(current_user), alert: transaction.errors.to_s}
      end
    end
  end
  
  private
    def set_camp_app
	    @camp_app = current_user.camp_applications.where(camp_id: @camp.id).first
    end

    def payment_params
        params.require(:payment).permit(:pmt_type, :note, :amount, :payment_method_nonce)        
    end

    def charge_user(order)
        transaction = Transaction.new(order, params[:payment_method_nonce])
        transaction.execute
        transaction.ok?
    end
end
