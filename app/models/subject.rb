class Subject < ApplicationRecord
  # Associations
  has_many :subject_users, dependent: :destroy
  has_many :users, through: :subject_users

  # Validation
  validates :name, presence: true
end
