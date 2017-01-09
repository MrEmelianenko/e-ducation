class Conversation < ApplicationRecord
  # Associations
  has_many :messages,           dependent: :destroy
  has_many :conversation_users, dependent: :destroy
  has_many :users, through: :conversation_users

  # Scopes
  def self.for_user(user)
    joins(:conversation_users).where(conversation_users: { user: user }).uniq
  end

  def self.by_users(users)
    users = users.uniq
    query =
      ConversationUser
        .select(:conversation_id)
        .group(:conversation_id)
        .having(
          'COUNT(DISTINCT(user_id)) = ? AND array_agg(user_id) @> array[?]',
          users.count, users.map(&:id)
        )

    conversation = Conversation.where(id: query).take
    return conversation if conversation

    conversation = Conversation.new
    conversation.users = users.uniq
    conversation.save!

    conversation
  end
end
