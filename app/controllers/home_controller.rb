class HomeController < ApplicationController
  def index
    @lendee = Lendee.new
  end

  def check_rate

  end

  def invest
    render :layout => 'home_ancillary'
  end

  def personal_loan
    render :layout => 'home_ancillary'
  end

  def how_it_works
    render :layout => 'home_ancillary'
  end

  def about
    render :layout => 'home_ancillary'
  end


end
