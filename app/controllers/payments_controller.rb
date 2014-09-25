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

end
