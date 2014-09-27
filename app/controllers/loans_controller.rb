require 'builder'
# require 'will_paginate'
include ActionView::Helpers::NumberHelper

class LoansController < ApplicationController

  def index
    @filterrific = Filterrific.new(Loan, params[:filterrific] || session[:filterrific_loans])
    @filterrific.select_options = {
      # sorted_by: Loan.options_for_sorted_by,
      rate: Loan.options_for_rate_select,
      term: Loan.options_for_term_select
    }
    @loans = Loan.where(funded?: false).where("expiration_date > ?", Date.today).filterrific_find(@filterrific).page(params[:page])

    session[:filterrific_students] = @filterrific.to_hash

    respond_to do |format|
      format.html
      format.js
    end
  end

  def reset_filterrific
    # Clear session persistence
    session[:filterrific_loans] = nil
    # Redirect back to the index action for default filter settings.
    redirect_to action: :index
  end

  def show
    @loan = Loan.find_by(lendee_id: current_lendee.id)
  end

  def new
    render layout: 'lendees'
  end

  def create
    rate = get_rate current_lendee.credit_range
    # TODO: write transaction script for CreateLoan
    # CreateLoan.run(loan_params.merge!(rate: rate, lendee_id: current_lendee.id, flash: flash))
    if Loan.create(loan_params.merge(rate: rate, lendee_id: current_lendee.id, amount_remaining: loan_params[:amount_requested]))
      flash[:success] = "Your loan was created successfully"
      redirect_to profile_path
    else
      flash[:error] = "Something went wrong"
      redirect_to new_loan_path
    end
  end

  def edit
  end

  def update
  end

  def loan_params
    params.require(:loan).permit(:amount_requested, :term, :expiration_date)
  end

  def updated_loan_params
    params.permit(:rate, :term)
  end
end
