class LendeesController < ApplicationController
  before_action :authenticate_lendee!, only: [:show_profile, :edit, :update]

  def show_profile
    @lendee = current_lendee
    @payments = Payment.where(lendee_id: @lendee.id)
    unpaid_payment_count = 0
    unpaid_payment = false
    @payments.each do |payment|
      if !payment.paid?
        unpaid_payment_count += 1
      end
    end
    flash[:alert] = "You have #{unpaid_payment_count} unpaid payments" if unpaid_payment
    @loan = @lendee.loan
    @investments = Investment.where(loan_id: @loan.id).limit(7)
    @amount_funded = @loan.amount_funded
    @amount_requested = @loan.amount
  end

  def show
    @lendee = Lendee.find(params[:id])
    @loan = @lendee.loan
    @investments = Investment.where(loan_id: @loan.id).limit(7)
    @amount_funded = @loan.amount_funded
    @amount_requested = @loan.amount
    @payments = Payment.where(lendee_id: @lendee.id)
  end

  def edit
    @lendee = current_lendee
  end

  def update
  end
end
