class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  def get_rate credit_range
    if credit_range == 'below 600'
      24.63
    elsif credit_range == '600-660'
      17.98
    elsif credit_range == '660-720'
      12.99
    elsif credit_range == '720+'
      7.71
    end
  end
end
