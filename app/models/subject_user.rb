class SubjectUser < ApplicationRecord
  # Associations
  belongs_to :subject
  belongs_to :user

  # Validations
  validates :subject_id, presence: true
  validates :user_id,    presence: true

  # Enumerable
  enum relation_type: {
    teacher: 10
  }
end
