class GradeDecorator < ApplicationDecorator
  def teacher
    return @_teacher if defined?(@_teacher)
    @_teacher = grade_users.teacher.take&.user
  end

  def students_count
    grade_users.student.count
  end

  def to_s
    name
  end
end
