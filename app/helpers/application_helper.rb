module ApplicationHelper
  def current_user_decorated
    return @_current_user_decorated if defined?(@_current_user_decorated)
    @_current_user_decorated = current_user&.decorate
  end
end
