class ConversationDecorator < ApplicationDecorator
  def to_s
    if users.count == 2
      users.select { |user| user.id != helpers.current_user.id }.first.name_formatted
    else
      users.limit(3).map(&:name_formatted).join(', ')
    end
  end
end
