class LoansController < ApplicationController

  def index
  end

  def show
    @loan = Loan.find_by(lendee_id: current_lendee.id)
  end

  def new
  end

  def create
    rate = get_rate current_lendee.credit_range
    if Loan.create(loan_params.merge(rate: rate, lendee_id: current_lendee.id))
      flash[:success] = "Your loan was created successfully"
      redirect_to profile_path
    else
      flash[:error] = "Something went wrong"
      redirect_to new_loan_path
    end
  end

  def edit
  end

  def update
  end

  def loan_params
    params.require(:loan).permit(:amount, :term, :expiration_date)
  end
end
