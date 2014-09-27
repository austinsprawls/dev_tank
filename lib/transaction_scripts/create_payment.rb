class CreatePayment
  def self.run(strong_params)
    current_lendee = strong_params[:current_lendee]
    investments_to_pay = Investment.where(loan_id: current_lendee.loan.id)

    investments_to_pay.each do |investment|
      loan = Loan.find(investment.loan.id)
      payment_amount = (investment.amount/loan.term)+(investment.amount*loan.rate/100)
      Payment.create(lender_id: investment.lender_id, lendee_id: current_lendee.id, amount: payment_amount )
    end

  end
end
