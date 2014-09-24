class LendersController < ApplicationController
  before_action :authenticate_lender!

  def show
    @lender = current_lender
    @total_invested = @lender.total_invested
    @lender_investments = Investment.where(lender_id: @lender.id)
    payment_amounts = Payment.where(lender_id: current_lender.id).map {|payment| payment.amount}
    @total_returns = payment_amounts.inject(:+)
    @expected_returns = @lender_investments.map{|investment| investment.expected_return}.inject(:+)
  end

end
