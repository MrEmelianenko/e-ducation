module ApplicationHelper
  def current_user_decorated
    return @_current_user_decorated if defined?(@_current_user_decorated)
    @_current_user_decorated = current_user&.decorate
  end

  def alert_class(flash_type)
    {
      success: 'alert-success',
      error:   'alert-danger',
      alert:   'alert-warning',
      notice:  'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages
    flash.each do |type, message|
      concat(
        content_tag(:div, message, class: "alert #{alert_class(type)}") do
          concat content_tag(:button, 'x', class: 'close', data: { dismiss: 'alert' })
          concat message
        end
      )
    end

    nil
  end
end
