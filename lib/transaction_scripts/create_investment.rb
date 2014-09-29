require 'transaction_scripts/create_payments'

class CreateInvestment
  def self.run(strong_params)
    flash = strong_params[:flash]
    current_lendee = strong_params[:current_lendee]
    current_lender = strong_params[:current_lender]
    amount = strong_params[:amount].to_f
    loan_id = strong_params[:loan_id]
    loan = Loan.find(loan_id)

    if current_lendee
      flash[:alert] = "You must be registered as an investor to invest"
    elsif !current_lender
      flash[:alert] = "You must be signed in to invest"
    elsif amount.blank?
      flash[:alert] = "You must enter an amount to invest"
    elsif amount < 25
      flash[:alert] = "Investment must be at least $25"
    elsif amount > current_lender.funds
      flash[:alert] = "You don't have enough funds to invest $#{amount}"
    elsif amount > loan.amount_remaining
      flash[:alert] = "You can't invest more than the amount remaining on the loan"
    else
      expected_return = (loan.rate/100) * amount
      Investment.create(lender_id: current_lender.id, loan_id: loan_id, amount: amount, expected_return: expected_return)
      current_lender.increment!(:total_invested, amount)
      loan.increment!(:amount_funded, amount)
      loan.decrement!(:amount_remaining, amount)
      loan.update_attributes(funded?: true) if loan.amount_funded >= loan.amount_requested
      if loan.funded?
        CreatePayments.run(loan: loan)
      end
      flash[:success] = "You successfully invested $#{amount} in loan ##{loan.created_at.to_i}"
    end
  end
end
