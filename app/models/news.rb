class News < ApplicationRecord
  # Associations
  belongs_to :user

  # Validation
  validates :title, presence: true
  validates :body,  presence: true
end
