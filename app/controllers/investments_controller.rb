require 'transaction_scripts/create_investment'

class InvestmentsController < ApplicationController

  def create
    CreateInvestment.run(strong_params.merge!(current_lender: current_lender, current_lendee: current_lendee, flash: flash))
    redirect_to browse_loans_path
  end

  def strong_params
    params.require(:investment).permit(:amount, :loan_id)
  end

end
