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
    payment = Payment.find(params[:id])
    amount_paid = payment_params[:amount_paid].to_f
    if amount_paid <= payment.amount && amount_paid > 0
      payment.update_attributes(amount_paid: amount_paid)
      payment.update_attributes(paid?: true) if payment.amount_paid == payment.amount
      flash[:success] = "You successfully paid $#{amount_paid}"
      redirect_to profile_path
    else
      flash[:alert] = "You must enter a value greater than zero and less than $#{payment.amount}"
      redirect_to edit_lendee_payment_path(params[:lendee_id], params[:id])
    end
  end

  def payment_params
    params.require(:payment).permit(:amount_paid)
  end

end
