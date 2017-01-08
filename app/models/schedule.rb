class Schedule < ApplicationRecord
  # Associations
  belongs_to :subject
  belongs_to :grade
  belongs_to :user
  has_many :schedule_users, dependent: :destroy
  has_many :users, through: :schedule_users

  # Validations
  validates :subject_id, presence: true
  validates :grade_id,   presence: true
  validates :user_id,    presence: true
  validates :start_at,   presence: true

  # Callbacks
  before_save   :set_finish_at
  before_create :build_schedule_users

  def start_time
    start_at
  end

  private

  def set_finish_at
    return if finish_at.present?
    self.finish_at = start_at + 45.minutes
  end

  def build_schedule_users
    users_ids = grade.grade_users.student.pluck(:user_id)
    users_ids.each do |user_id|
      schedule_users.new(user_id: user_id)
    end
  end
end
