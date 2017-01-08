class SubjectsController < ApplicationController
  def index
    render locals: { subjects: subjects.decorate }
  end

  def show
    render locals: { subject: subject.decorate }
  end

  def new
    render locals: { subject: Subject.new }
  end

  def create
    subject = Subject.new(subject_params)

    if subject.save
      redirect_to subjects_path, notice: t('notifications.created')
    else
      render :new, locals: { subject: subject }
    end
  end

  def edit
    render locals: { subject: subject }
  end

  def update
    if subject.update(subject_params)
      redirect_to subjects_path, notice: t('notifications.updated')
    else
      render :new, locals: { subject: subject }
    end
  end

  def destroy
    subject.destroy!
    redirect_to subjects_path, notice: t('notifications.destroyed')
  end

  private

  def subject
    return @_subject if defined?(@_subject)
    @_subject = Subject.find(params[:id])
  end

  def subjects
    return @_subjects if defined?(@_subjects)
    @_subjects = Subject.all
  end

  def subject_params
  end
end
