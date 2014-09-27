require 'transaction_scripts/create_recurring_payment'

class UpdatePayment
  def self.run(payment_params)
    flash = payment_params[:flash]
    payment = Payment.find(payment_params[:id])
    amount_paid = payment_params[:amount_paid].to_f

    if amount_paid <= payment.amount && amount_paid > 0
      payment.update_attributes(amount_paid: amount_paid)
      if payment.amount_paid == payment.amount
        payment.update_attributes(paid?: true)
        CreateRecurringPayment.run(payment: payment)
      end
      flash[:success] = "You successfully paid $#{amount_paid}"
      return {success?: true}
    else
      flash[:alert] = "You must enter a value greater than zero and less than $#{payment.amount}"
      return {success?: false}
    end
  end
end
