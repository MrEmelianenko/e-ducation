class News < ApplicationRecord
  # Associations
  belongs_to :user

  # Validations
  validates :title, presence: true
  validates :body,  presence: true

  # Scopes
  scope :ordered, -> { order(created_at: :desc) }
end
