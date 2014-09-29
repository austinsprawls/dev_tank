class HomeController < ApplicationController

  def index
  end

  def check_rate
    @amount_requested = rate_params['amount']
    @credit_range = rate_params['credit_range']
    render layout: 'home_ancillary'
  end

  def invest
    render layout: 'home_ancillary'
  end

  def personal_loan
    render layout: 'home_ancillary'
  end

  def how_it_works
    render layout: 'home_ancillary'
  end

  def about
    render layout: 'home_ancillary'
  end

  def rate_params
    params.permit('amount', 'credit_range')
  end


end
