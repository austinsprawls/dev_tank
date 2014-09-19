class LendeesController < ApplicationController
  before_action :authenticate_lendee!

  def show
    @lendee = Lendee.find(current_lendee.id)
    @investments = Investment.where(lender_id: current_lendee.id)
  end

  def edit
  end

  def update
  end
end
