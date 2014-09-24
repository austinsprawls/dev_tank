class InvestmentsController < ApplicationController

  def create
    if current_lendee
      flash[:alert] = "You must be registered as an investor to invest"
    elsif !current_lender
      flash[:alert] = "You must be signed in to invest"
    elsif strong_params[:amount].blank?
      flash[:alert] = "You must enter an amount to invest"
    elsif strong_params[:amount].to_f < 0
      flash[:alert] = "Investment must be a positive number"
    else
      loan = Loan.find(strong_params[:loan_id])
      expected_return = strong_params[:amount].to_f + ((loan.rate/100) * strong_params[:amount].to_f)
      Investment.create(lender_id: current_lender.id, loan_id: strong_params[:loan_id], amount: strong_params[:amount].to_f, expected_return: expected_return)
      current_lender.increment!(:total_invested, strong_params[:amount].to_f)
      loan.increment!(:amount_funded, strong_params[:amount].to_f)
      loan.decrement!(:amount, strong_params[:amount].to_f)
      loan.update_attributes(funded?: true) if loan.amount >= loan.amount_funded
      flash[:success] = "You successfully invested $#{strong_params[:amount]} in loan ##{loan.created_at.to_i}"
    end
    redirect_to browse_loans_path
  end

  def strong_params
    params.require(:investment).permit(:amount, :loan_id)
  end

end
