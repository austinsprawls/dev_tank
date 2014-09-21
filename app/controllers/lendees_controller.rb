class LendeesController < ApplicationController
  before_action :authenticate_lendee!

  def show
    @lendee = current_lendee
    @loan = current_lendee.loan
    @investments = Investment.where(loan_id: @loan.id).limit(7)
    @amount_funded = @loan.amount_funded
    @amount_requested = @loan.amount
  end

  def edit
  end

  def update
  end
end
