class GradeUser < ApplicationRecord
  # Associations
  belongs_to :grade
  belongs_to :user

  # Validation
  validates :grade_id, presence: true
  validates :user_id,  presence: true

  # Enumerable
  enum relation_type: {
    member: 10,
    mentor: 20
  }
end
