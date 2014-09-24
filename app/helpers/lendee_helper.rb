module LendeeHelper
  def percent_funded(amount_funded, amount_requested)
    (amount_funded/amount_requested*100).round(2)
  end

  def remaining(amount_requested, amount_funded)
    amount_requested - amount_funded
  end
end
