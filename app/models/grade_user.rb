class GradeUser < ApplicationRecord
  # Associations
  belongs_to :grade
  belongs_to :user

  # Validations
  validates :grade_id, presence: true
  validates :user_id,  presence: true

  # Enumerable
  enum relation_type: {
    student: 10,
    teacher: 20
  }

  # Scopes
  scope :ordered, -> { joins(:user).order('grade_users.relation_type DESC, users.last_name COLLATE "C" ASC') }
end
