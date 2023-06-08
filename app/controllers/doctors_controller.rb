class DoctorsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_doctor, only: [ :edit, :update, :destroy]

    def index
        @doctor = Doctor.all
    end

    def new
         @doctor = Doctor.new
    end

    def create
        @doctor = Doctor.new(doctor_params)
        respond_to do |format|
            if @doctor.save 
                format.turbo_stream
                format.html { redirect_to doctors_path, notice: 'Doctor registrado' }
            else
                format.html { render :new }
            end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @doctor.update(doctor_params)
                format.turbo_stream
                format.html { redirect_to doctors_path, notice: 'Doctor actualizado' }
            else
                format.html { render :edit }
            end
        end
    end

    def destroy
        @doctor.destroy
        respond_to do |format|
            format.turbo_stream
            format.html { redirect_to doctors_path, notice: 'Doctor eliminado' }
        end
    end

    private

    def set_doctor
        @doctor = Doctor.find(params[:id])
    end

    def doctor_params
        params.require(:doctor).permit(:first_name, :last_name, :code, :user_id)
    end
end
