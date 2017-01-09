class User < ApplicationRecord
  # Extensions
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Associations
  has_many :user_attributes, dependent: :destroy
  has_many :user_relations,  dependent: :destroy
  has_many :grade_users,     dependent: :destroy
  has_many :subject_users,   dependent: :destroy
  has_many :schedule_users,  dependent: :destroy
  has_many :evaluations,       foreign_key: :to_user_id, dependent: :destroy
  has_many :to_user_relations, foreign_key: :to_user_id, class_name: 'UserRelation'
  has_many :grades,    through: :grade_users
  has_many :subjects,  through: :subject_users
  has_many :schedules, through: :schedule_users
  has_many :teacher_schedules, class_name: 'Schedule', dependent: :destroy

  # Validations
  validates :first_name, presence: true
  validates :last_name,  presence: true

  # Enumerable
  enum role: {
    student:  10,
    guardian: 20,
    teacher:  30,
    staff:    40
  }

  # Scopes
  scope :ordered, -> { order('last_name COLLATE "C" ASC') }
end
