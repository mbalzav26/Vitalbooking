class AppointmentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_appointment, only: [:show, :edit, :update, :destroy]

    def index
        @appointments = Appointment.all
        respond_to do |format|
            format.html
            format.json { render json: @appointments }
        end
    end


    def new
        @appointment = Appointment.new
    end

    def create
        @appointment = Appointment.new(appointment_params)
        if @appointment.save
            redirect_to root_path, notice: 'La cita se ha creado correctamente.'
        else
            render :new
        end
    end

    def edit

    end

    def update
        if @appointment.update(appointment_params)
            redirect_to appointments_url, notice: 'La cita se ha actualizado correctamente.'
        else
            render :edit
        end
    end

    private

    def set_appointment
        @appointment = Appointment.find(params[:id])
    end

    def appointment_params
        params.require(:appointment).permit(:appointment_date, :doctor_id, :patient_id, :user_id, :clinic_id, :reason, :status, :start, :end, :title)
    end
end
