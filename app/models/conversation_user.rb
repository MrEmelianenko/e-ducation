class ConversationUser < ApplicationRecord
  # Associations
  belongs_to :conversation
  belongs_to :user
end
