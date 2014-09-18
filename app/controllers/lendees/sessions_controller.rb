class Lendees::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    lendee_path(resource.id)
  end
end
