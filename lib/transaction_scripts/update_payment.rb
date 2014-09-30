require 'transaction_scripts/create_recurring_payment'

class UpdatePayment
  def self.run(payment_params)
    payment = Payment.find(payment_params[:id])
    amount_paid = payment_params[:amount_paid].to_f

    if amount_paid <= payment.amount && amount_paid > 0
      payment.update_attributes(amount_paid: amount_paid)
      if payment.amount_paid == payment.amount
        payment.update_attributes(paid?: true)
        CreateRecurringPayment.run(payment: payment)
      end
      return {success?: true, flash: "You successfully paid $#{amount_paid}"}
    else
      return {success?: false, flash: "You must enter a value greater than zero and less than $#{payment.amount}" }
    end
  end
end
