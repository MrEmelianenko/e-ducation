class ScheduleDecorator < ApplicationDecorator
  def to_s
    return name if name.present?
    "#{subject.name} - #{grade.name}"
  end
end
