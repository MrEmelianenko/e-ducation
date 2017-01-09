class Subject < ApplicationRecord
  # Associations
  has_many :schedules,     dependent: :destroy
  has_many :evaluations,   dependent: :destroy
  has_many :subject_users, dependent: :destroy
  has_many :users, through: :subject_users

  # Validations
  validates :name, presence: true
end
