class LendeesController < ApplicationController
  before_action :authenticate_lendee!, only: [:show_profile]

  def show_profile
    @lendee = current_lendee
    @loan = @lendee.loan
    @investments = Investment.where(loan_id: @loan.id).limit(7)
    @amount_funded = @loan.amount_funded
    @amount_requested = @loan.amount
  end

  def show
    @lendee = Lendee.find(params[:id])
    @loan = @lendee.loan
    @investments = Investment.where(loan_id: @loan.id).limit(7)
    @amount_funded = @loan.amount_funded
    @amount_requested = @loan.amount
  end

  def edit
  end

  def update
  end
end
