require 'transaction_scripts/update_payment'

class PaymentsController < ApplicationController

  def index
    if current_lendee
      @payments = Payment.where(lendee_id: current_lendee.id)
    elsif current_lender
      @payments = Payment.where(lender_id: current_lender.id)
    end
  end

  def show
    @payment = Payment.find(params[:id])
  end

  def edit
    @payment = Payment.find(params[:id])
    render layout: 'lendees'
  end

  def update
    result = UpdatePayment.run(payment_params.merge(params).merge(flash: flash))
    if result[:success?]
      redirect_to profile_path
    else
      redirect_to edit_lendee_payment_path(params[:lendee_id], params[:id])
    end
  end

  def payment_params
    params.require(:payment).permit(:amount_paid)
  end

end
