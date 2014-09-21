class Lenders::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    portfolio_path
  end
end
