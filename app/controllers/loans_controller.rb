require 'builder'
# require 'will_paginate'
include ActionView::Helpers::NumberHelper

class LoansController < ApplicationController

  def index
    # if updated_loan_params['rate'] && updated_loan_params['term']
    #   @all_loans = Loan.where(funded?: false, rate: updated_loan_params['rate'], term: updated_loan_params['term'])
    #   .where("expiration_date > ?", Date.today)
    # elsif updated_loan_params['rate']
    #   @all_loans = Loan.where(funded?: false, rate: updated_loan_params['rate'])
    #   .where("expiration_date > ?", Date.today)
    # elsif updated_loan_params['term']
    #   @all_loans = Loan.where(funded?: false, term: updated_loan_params['term'])
    #   .where("expiration_date > ?", Date.today)
    # else
    #   @all_loans = Loan.where(funded?: false).where("expiration_date > ?", Date.today)
    # end
    @filterrific = Filterrific.new(Loan, params[:filterrific] || session[:filterrific_loans])
    @filterrific.select_options = {
      # sorted_by: Loan.options_for_sorted_by,
      rate: Loan.options_for_rate_select,
      term: Loan.options_for_term_select
    }
    @loans = Loan.filterrific_find(@filterrific).page(params[:page])

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
  end

  def create
    rate = get_rate current_lendee.credit_range
    if Loan.create(loan_params.merge(rate: rate, lendee_id: current_lendee.id))
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
    params.require(:loan).permit(:amount, :term, :expiration_date)
  end

  def updated_loan_params
    params.permit(:rate, :term)
  end
end
