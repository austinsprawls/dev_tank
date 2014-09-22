class InvestmentsController < ApplicationController

  def create
    if current_lendee
      flash[:alert] = "You must be registered as an investor to invest"
    elsif !current_lender
      flash[:alert] = "You must be signed in to invest"
    end
    redirect_to browse_loans_path
  end

end
