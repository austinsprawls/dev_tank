class LendersController < ApplicationController
  before_action :authenticate_lender!

  def show
    @lender = current_lender
    @total_invested = @lender.total_invested
    all_lender_investments = Investment.where(lender_id: @lender.id)
    @lender_investments = all_lender_investments.limit(5)
    all_lender_payments = Payment.where(lender_id: current_lender.id)
    @lender_payments = all_lender_payments.limit(5)
    payment_amounts = all_lender_payments.map {|payment| payment.amount}
    @total_returns = payment_amounts.inject(:+)
    @expected_returns = all_lender_investments.map{|investment| investment.expected_return}.inject(:+)
  end

end
