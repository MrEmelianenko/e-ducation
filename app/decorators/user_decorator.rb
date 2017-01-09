class UserDecorator < ApplicationDecorator
  def name
    "#{last_name} #{first_name}"
  end

  def name_formatted
    "<strong>#{last_name}</strong> #{first_name}".html_safe
  end

  def role_readable
    I18n.t("roles.#{role}")
  end

  def any_relations?
    user_relations.any? || to_user_relations.any?
  end

  def me?
    helpers.current_user == self
  end

  def to_s
    name
  end
end
