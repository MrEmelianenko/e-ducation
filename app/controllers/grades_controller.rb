class GradesController < ApplicationController
  def index
    render locals: { grades: grades.decorate }
  end

  def show
    render locals: { grade: grade.decorate }
  end

  def new
    render locals: { grade: Grade.new }
  end

  def create
    grade = Grade.new(grade_params)

    if grade.save
      redirect_to grades_path, notice: t('notifications.created')
    else
      render :new, locals: { grade: grade }
    end
  end

  def edit
    render locals: { grade: grade }
  end

  def update
    if grade.update(grade_params)
      redirect_to grades_path, notice: t('notifications.updated')
    else
      render :new, locals: { grade: grade }
    end
  end

  def destroy
    grade.destroy!
    redirect_to grades_path, notice: t('notifications.destroyed')
  end

  private

  def grade
    return @_grade if defined?(@_grade)
    @_grade = Grade.find(params[:id])
  end

  def grades
    return @_grades if defined?(@_grades)
    @_grades = Grade.all
  end

  def grade_params
  end
end
