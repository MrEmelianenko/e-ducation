class SchedulesController < ApplicationController
  def index
    render locals: { schedules: schedules.decorate }
  end

  def show
    render locals: { schedule: schedule.decorate }
  end

  def new
    render locals: { schedule: Schedule.new }
  end

  def create
    schedule = Schedule.new(schedule_params)

    if schedule.save
      redirect_to schedules_path, notice: t('notifications.created')
    else
      render :new, locals: { schedule: schedule }
    end
  end

  def edit
    render locals: { schedule: schedule }
  end

  def update
    if schedule.update(schedule_params)
      redirect_to schedules_path, notice: t('notifications.updated')
    else
      render :new, locals: { schedule: schedule }
    end
  end

  def destroy
    schedule.destroy!
    redirect_to schedules_path, notice: t('notifications.destroyed')
  end

  private

  def schedule
    return @_schedule if defined?(@_schedule)
    @_schedule = Schedule.find(params[:id])
  end

  def schedules
    return @_schedules if defined?(@_schedules)
    @_schedules = Schedule.all
  end

  def schedule_params
  end
end
