class CreateRecurringPayment
  def self.run(params)
    puts "now entered CreateRecurringPayment txs"
    payment = params[:payment]
    lender_id = payment.lender_id
    lendee_id = payment.lendee_id
    lendee = Lendee.find(lendee_id)
    payment_amount = payment.amount
    loan_amount_requested = Loan.find_by(lendee_id: lendee_id).amount_requested
    all_payments = Payment.where(lendee_id: lendee_id, paid?: true)
    total_paid = all_payments.map{|payment| payment.amount_paid}.inject(:+)

    puts "total paid: #{total_paid}"
    puts "loan_amount_requested: #{loan_amount_requested}"

    unless total_paid >= loan_amount_requested
      puts "entered the conditional"
      Payment.create(lender_id: lender_id, lendee_id: lendee_id, amount: payment_amount, due_date: payment.due_date+1.month)
    end
  end
end
