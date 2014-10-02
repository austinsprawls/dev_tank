require 'transaction_scripts/update_payment'

class PaymentsController < ApplicationController

  def index
    if current_lendee
      @payments = Payment.where(lendee_id: current_lendee.id)
      render layout: 'lendees'
    elsif current_lender
      @payments = Payment.where(lender_id: current_lender.id)
      render layout: 'lenders'
    end
  end

  def show
    if current_lendee
      @payment = Payment.find(params[:id])
    elsif current_lender
    end
  end

  def edit
    @payment = Payment.find(params[:id])
    render layout: 'lendees'
  end

  def update
    result = UpdatePayment.run(payment_params.merge(params))
    if result[:loan_completely_paid?]
      flash[:success] = "Congratulations! You have paid off your loan."
    elsif result[:success?]
      flash[:success] = result[:flash]
      redirect_to profile_path
    else
      flash[:alert] = result[:flash]
      redirect_to edit_lendee_payment_path(params[:lendee_id], params[:id])
    end
  end

  def bulk_pay
    payments = Payment.where(lendee_id: current_lendee.id, paid?: false)
    total_to_pay = payments.map {|pay| pay.amount}.inject(:+)
    payments[0..-2].each do |payment|
      UpdatePayment.run(id: payment.id, amount_paid: payment.amount)
    end
    result = UpdatePayment.run(id: payments[-1].id, amount_paid: payments[-1].amount)
    if result[:loan_completely_paid?]
      flash[:success] = "Congratulations! You have paid off your loan."
    else
      flash[:success] = "You successfully paid $#{total_to_pay}"
    end
    redirect_to profile_path
  end

  def payment_params
    params.require(:payment).permit(:amount_paid)
  end

end
