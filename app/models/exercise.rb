class Exercise < ApplicationRecord
  belongs_to :user

  validates :duration_in_min, presence: true
  validates :duration_in_min, numericality: { only_int: true }
  validates :workout, presence: true
  validates :workout_date, presence: true
  validates :user_id, presence: true

  default_scope {where('workout_date > ?', 7.days.ago).order(workout_date: :desc) }
end
