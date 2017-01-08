class UserRelation < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :to_user, class_name: 'User'

  # Validations
  validates :user_id,    presence: true
  validates :to_user_id, presence: true

  # Enumerable
  enum relation_type: {
    brother:  10,
    sister:   20,
    mother:   30,
    father:   40,
    guardian: 50
  }
end
