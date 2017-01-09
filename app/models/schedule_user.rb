class ScheduleUser < ApplicationRecord
  # Associations
  belongs_to :schedule
  belongs_to :user

  # Validations
  validates :schedule_id, presence: true
  validates :user_id,     presence: true

  # Enumerable
  enum status: {
    absent:  10,
    present: 20,
    kicked:  30
  }

  # Scopes
  scope :with_comment, -> { where.not(comment: nil) }
end
