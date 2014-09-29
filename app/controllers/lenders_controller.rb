require 'transaction_scripts/confirm_quik_invest'
require 'transaction_scripts/create_investment'

class LendersController < ApplicationController
  before_action :authenticate_lender!

  def show
    @lender = current_lender
    @total_invested = @lender.total_invested
    all_lender_investments = Investment.where(lender_id: @lender.id)
    @lender_investments = all_lender_investments.limit(5)
    all_lender_payments = Payment.where(lender_id: current_lender.id)
    @lender_payments = all_lender_payments.limit(5)
    payment_amounts = all_lender_payments.select{|payment| payment.paid?}.map {|payment| payment.amount}
    @total_collected = payment_amounts.inject(:+)
    @expected_returns = all_lender_investments.map{|investment| investment.expected_return}.inject(:+)
  end

  def add_funds
    if fund_params[:funds] == '' || fund_params[:funds].to_f <= 0
      flash[:alert] = "You must enter a value greater than zero"
    else
      current_lender.increment!(:funds, fund_params[:funds].to_f)
      flash[:success] = "You successfully added $#{fund_params[:funds]} to your account"
    end
    redirect_to portfolio_path
  end

  def quik_invest
  end

  def review_quik_invest

  end

  def confirm_quik_invest
    result = ConfirmQuikInvest.run(quik_invest_params.merge(current_lender: current_lender))
    total_invested = result[:total_invested]
    invested_loan_count = result[:invested_loan_count]

    flash[:success] = "You succesfully invested $#{total_invested} in #{invested_loan_count} loans"
    redirect_to portfolio_path
  end

  def fund_params
    params.require(:lender).permit(:funds)
  end

  def quik_invest_params
    params.permit(:total, :max)
  end

end
