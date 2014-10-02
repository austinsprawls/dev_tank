class CreateRecurringPayment
  def self.run(params)
    payment = params[:payment]
    lender_id = payment.lender_id
    lendee_id = payment.lendee_id
    lendee = Lendee.find(lendee_id)
    payment_amount = payment.amount
    loan = Loan.find_by(lendee_id: lendee_id)
    loan_amount_requested = loan.amount_requested
    all_payments = Payment.where(lendee_id: lendee_id, paid?: true)
    total_paid = all_payments.map{|payment| payment.amount_paid}.inject(:+)

    if total_paid >= (loan_amount_requested + loan_amount_requested * loan.rate / 100)
      return {loan_completely_paid?: true}
    else
      Payment.create(lender_id: lender_id, lendee_id: lendee_id, amount: payment_amount, due_date: payment.due_date+1.month)
      return {loan_completely_paid?: false}
    end
  end
end
