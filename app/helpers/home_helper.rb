module HomeHelper
  #helper methods to render devise sign up form
  def resource_name
    :lendee
  end

  def resource
    @resource ||= Lendee.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:lendee]
  end
end
