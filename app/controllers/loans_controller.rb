class LoansController < ApplicationController

  def index
    @all_loans = Loan.where(funded?: false).where("expiration_date > ?", Date.today)
  end

  def update_loan_results
    if updated_loan_params['rate'] && updated_loan_params['term']
      @all_loans = Loan.where(funded?: false, rate: updated_loan_params['rate'], term: updated_loan_params['term'])
      .where("expiration_date > ?", Date.today)
    elsif updated_loan_params['rate']
      @all_loans = Loan.where(funded?: false, rate: updated_loan_params['rate'])
      .where("expiration_date > ?", Date.today)
    elsif updated_loan_params['term']
      @all_loans = Loan.where(funded?: false, term: updated_loan_params['term'])
      .where("expiration_date > ?", Date.today)
    else
      @all_loans = Loan.where(funded?: false).where("expiration_date > ?", Date.today)
    end
    render 'loans/index'
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

  def updated_loan_params
    params.permit(:rate, :term)
  end
end
