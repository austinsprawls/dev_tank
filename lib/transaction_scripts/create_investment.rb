
  class CreateInvestment
    def self.run(strong_params)
      flash = strong_params[:flash]
      current_lendee = strong_params[:current_lendee]
      current_lender = strong_params[:current_lender]
      amount = strong_params[:amount]
      loan_id = strong_params[:loan_id]

      if current_lendee
        flash[:alert] = "You must be registered as an investor to invest"
      elsif !current_lender
        flash[:alert] = "You must be signed in to invest"
      elsif amount.blank?
        flash[:alert] = "You must enter an amount to invest"
      elsif amount.to_f <= 0
        flash[:alert] = "Investment must be a positive number"
      else
        loan = Loan.find(loan_id)
        expected_return = (loan.rate/100) * amount.to_f
        Investment.create(lender_id: current_lender.id, loan_id: loan_id, amount: amount.to_f, expected_return: expected_return)
        current_lender.increment!(:total_invested, amount.to_f)
        loan.increment!(:amount_funded, amount.to_f)
        loan.decrement!(:amount, amount.to_f)
        loan.update_attributes(funded?: true) if loan.amount <= loan.amount_funded
        flash[:success] = "You successfully invested $#{amount} in loan ##{loan.created_at.to_i}"
      end
    end
  end
