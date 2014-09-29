require 'transaction_scripts/create_investment'

class InvestmentsController < ApplicationController
  skip_before_filter  :verify_authenticity_token

  def create
    result = CreateInvestment.run(strong_params.merge!(current_lender: current_lender, current_lendee: current_lendee))
    if result[:success?]
      flash[:success] = result[:flash]
    else
      flash[:alert] = result[:flash]
    end
    redirect_to browse_loans_path
  end

  def index
    if current_lendee
      @investments = Investment.where(loan_id: current_lendee.loan.id)
    elsif current_lender
      @investments = Investment.where(lender_id: current_lender.id)
    end
  end

  def show
    @investment = Investment.find(params[:id])
  end

  def strong_params
    params.require(:investment).permit(:amount, :loan_id)
  end

end
