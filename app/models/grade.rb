class Grade < ApplicationRecord
  # Associations
  has_many :grade_users, dependent: :destroy
  has_many :users, through: :grade_users

  # Validation
  validates :name, presence: true
end
