class InvestmentsController < ApplicationController

  def create
    if current_lendee
      flash[:alert] = "You must be registered as an investor to invest"
    elsif !current_lender
      flash[:alert] = "You must be signed in to invest"
    else
      Investment.create(lender_id: current_lender.id, loan_id: strong_params[:loan_id], amount: strong_params[:amount].to_f)
      loan = Loan.find(strong_params[:loan_id])
      loan.increment!(:amount_funded, strong_params[:amount].to_f)
      loan.update_attributes(funded?: true) if loan.amount == loan.amount_funded
      flash[:success] = "You successfully invested $#{strong_params[:amount]}"
    end
    redirect_to browse_loans_path
  end

  def strong_params
    params.require(:investment).permit(:amount, :loan_id)
  end

end
