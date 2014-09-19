class LoansController < ApplicationController

  def show
    puts current_lendee
    @loan = Loan.find_by(lendee_id: current_lendee.id)
  end

  def new
    @loan = Loan.new(lendee_id: current_lendee.id)
  end

  def create
    rate = 
    @loan.update_attributes(loan_params)
  end

  def edit
  end

  def update
  end

  def loan_params
    params.require(:loan).permit(:amount, :term, :expiration_date)
  end
end
