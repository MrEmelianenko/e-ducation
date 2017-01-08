class UserAttribute < ApplicationRecord
  # Constants
  PROPERTIES = {
    student: [
      graduation_year: {
        type: :number
      }
    ],
    guardian: [
      work_place: {
        type: :string
      },
      work_number: {
        type: :string
      }
    ],
    stuff: []
  }

  # Associations
  belongs_to :user

  # Validation
  validates :user_id, presence: true
end
