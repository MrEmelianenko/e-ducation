class Message < ApplicationRecord
  # Associations
  belongs_to :conversation
  belongs_to :user

  # Validations
  validates :conversation_id, presence: true
  validates :user_id, presence: true
  validates :text, presence: true
end
