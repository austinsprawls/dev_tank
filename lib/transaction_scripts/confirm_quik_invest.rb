require 'transaction_scripts/create_investment'

class ConfirmQuikInvest

  def self.run(quik_invest_params)

    current_lender = quik_invest_params[:current_lender]
    total_to_invest = quik_invest_params[:total].to_f
    max_invest = quik_invest_params[:max].to_f
    loan_rates = Loan.all.map {|loan| loan.rate}.uniq
    number_of_investments = (total_to_invest/max_invest/loan_rates.size).to_i
    total_invested = 0.0
    invested_loan_count = 0

    loan_rates.each do |rate|
      index = 0
      selected_loans = Loan.where(rate: rate, funded?: false).where('amount_remaining >= ?', max_invest)
      expected_return = (rate/100) * max_invest
      selected_loans.size >= number_of_investments ? (num_of_investments = number_of_investments) : (num_of_investments = selected_loans.size)
      num_of_investments.times do
        # Investment.create(lender_id: current_lender.id,
        #                   loan_id: selected_loans[index].id,
        #                   amount: max_invest,
        #                   expected_return: expected_return)
        CreateInvestment.run(current_lender: current_lender, amount: max_invest, loan_id: selected_loans[index].id)
        total_invested += max_invest
        invested_loan_count += 1
        index += 1
      end
    end
    return {total_invested: total_invested, invested_loan_count: invested_loan_count}
  end
end
