class Schedule < ApplicationRecord
  # Associations
  belongs_to :subject
  belongs_to :grade
  belongs_to :user

  # Validation
  validates :subject_id, presence: true
  validates :grade_id,   presence: true
  validates :user_id,    presence: true
end
