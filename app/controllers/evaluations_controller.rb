class EvaluationsController < ApplicationController
  def create
    evaluation = Evaluation.new(evaluation_params)
    evaluation.from_user = current_user

    if evaluation.save
      notice = nil
    else
      notice = evaluation.errors.full_messages.join('. ')
    end

    if schedule
      redirect_to schedule_path(schedule), notice: notice
    else
      redirect_back fallback_location: users_path(evaluation.to_user), notice: notice
    end
  end

  def update
    if evaluation.update(evaluation_params)
      notice = nil
    else
      notice = evaluation.errors.full_messages.join('. ')
    end

    if schedule
      redirect_to schedule_path(schedule), notice: notice
    else
      redirect_back fallback_location: users_path(evaluation.to_user), notice: notice
    end
  end

  def destroy
    evaluation.destroy!

    if schedule
      redirect_to schedule_path(schedule)
    else
      redirect_back fallback_location: users_path(evaluation.to_user)
    end
  end

  private

  def evaluation
    return @_evaluation if defined?(@_evaluation)
    @_evaluation = Evaluation.find(params[:id])
  end

  def schedule
    return @_schedule if defined?(@_schedule)
    @_schedule = Schedule.find_by(id: params.dig(:evaluation, :schedule_id))
  end

  def evaluation_params
    params.require(:evaluation).permit(:to_user_id, :subject_id, :schedule_id, :value, :comment)
  end
end
