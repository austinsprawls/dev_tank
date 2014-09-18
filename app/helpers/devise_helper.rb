module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html =
    "<div class='alert alert-danger alert-block'> <button type='button'
    class='close' data-dismiss='alert'>x</button>
      #{messages}
    </div>"

    html.html_safe
  end
end
