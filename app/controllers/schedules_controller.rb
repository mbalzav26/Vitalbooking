class SchedulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_schedule, only: [ :edit, :update, :destroy]

  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def edit
  end

  def deleted
    @schedule = Schedule.with_deleted
  end

  def create
    @schedule = Schedule.new(schedule_params)
    respond_to do |format|
      if @schedule.save 
        format.turbo_stream
        format.html { redirect_to schedules_path, notice: 'Horario registrado' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.turbo_stream
        format.html { redirect_to schedules_path, notice: 'Horario actualizado' }
      else
        format.html { render :edit }
      end
    end
  end

  private


  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:start_time, :end_time, :doctor_id, :office_id)
  end
end
