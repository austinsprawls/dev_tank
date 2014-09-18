class HomeController < ApplicationController

  def index
    @lendee = Lendee.new
  end

  def check_rate
    render layout: 'home_ancillary'
    @amount_requested = rate_params['amount']
    puts @amount_requested
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
