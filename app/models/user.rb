class User < ApplicationRecord
  # Extensions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_many :user_attributes, dependent: :destroy

  # Validation
  validates :first_name, presence: true
  validates :last_name,  presence: true

  # Enumerable
  enum role: {
    student:  10,
    guardian: 20,
    staff:    30
  }
end
