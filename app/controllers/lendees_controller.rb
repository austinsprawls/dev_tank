class LendeesController < ApplicationController
  before_action :authenticate_lendee!, only: [:show_profile, :edit, :update]

  def show_profile
    @lendee = current_lendee
    all_payments = Payment.where(lendee_id: @lendee.id)
    unpaid_payment_count = 0
    unpaid_payment = false
    all_payments.each do |payment|
      if !payment.paid?
        unpaid_payment_count += 1
      end
    end
    @payments = all_payments.order('created_at DESC').limit(unpaid_payment_count)
    unpaid_payment = true if unpaid_payment_count > 0
    flash[:alert] = "You have #{unpaid_payment_count} unpaid payments" if unpaid_payment
    @loan = @lendee.loan
    if @loan
      @investments = Investment.order('created_at DESC').where(loan_id: @loan.id).limit(7)
      @amount_funded = @loan.amount_funded
      @amount_requested = @loan.amount_requested
    end
  end

  def show
    @lendee = Lendee.find(params[:id])
    @loan = @lendee.loan
    @investments = Investment.where(loan_id: @loan.id).limit(7)
    @amount_funded = @loan.amount_funded
    @amount_requested = @loan.amount_requested
    @payments = Payment.where(lendee_id: @lendee.id)
  end

  def edit
    @lendee = current_lendee
  end

  def update
  end
end
