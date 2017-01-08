class Grade < ApplicationRecord
  # Associations
  has_many :schedules,   dependent: :destroy
  has_many :grade_users, dependent: :destroy
  has_many :users, through: :grade_users

  # Validations
  validates :name, presence: true
end
