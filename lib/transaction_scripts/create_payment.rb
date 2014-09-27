class CreatePayment
  def self.run(strong_params)
    loan = strong_params[:loan]
    lendee = Lendee.find(loan.lendee_id)
    investments_to_pay = Investment.where(loan_id: loan.id)

    investments_to_pay.each do |investment|
      payment_amount = (investment.amount/loan.term)+(investment.amount/loan.term*loan.rate/100)
      Payment.create(lender_id: investment.lender_id, lendee_id: lendee.id, amount: payment_amount )
    end

  end
end
