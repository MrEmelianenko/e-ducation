class SchedulePolicy < ApplicationPolicy
  def set_absent?
    user.staff? || user.teacher?
  end

  def add_evaluations?
    user.staff? || user.teacher?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
