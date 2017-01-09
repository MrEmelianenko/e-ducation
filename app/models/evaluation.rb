class Evaluation < ApplicationRecord
  # Associations
  belongs_to :from_user, class_name: 'User'
  belongs_to :to_user, class_name: 'User'
  belongs_to :subject
  belongs_to :schedule, optional: true

  # Validations
  validates :from_user_id, presence: true
  validates :to_user_id,   presence: true
  validates :subject_id,   presence: true
  validates :value, inclusion: 1..5

  # Scopes
  def self.for_user(user)
    where(to_user: user)
  end
end
