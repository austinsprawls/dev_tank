module LoanHelper
  def credit_range(loan)
    Lendee.find(loan.lendee_id).credit_range
  end

  def loan_percent_funded(loan)
    (loan.amount_funded/loan.amount_requested).round(2)*100
  end

  def amount_remaining(loan)
    "%.2f" % (loan.amount_requested - loan.amount_funded)
  end

  def days_remaining(loan)
    (loan.expiration_date - Date.today).to_i
  end
end
