class PatientsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_patient, only: [:show, :edit, :update, :destroy]

    def index
        @patients = Patient.all
    end

    def new
        @patient = Patient.phones.build
    end

    def create
        @patient = Patient.new(patient_params)
        respond_to do |format|
            if @patient.save
                format.turbo_stream
                format.html { redirect_to @patient, notice: 'datos guardados' }
            else
                format.html { redirect_to patients_path, notice: 'error' }
            end
        end
    end

    def edit
    end

    def update
        @patient.update(patient_params)
    end

    def destroy

    end

    private

    def set_patient
        @patient = Patient.find(params[:id])
    end

    def patient_params
        params.require(:patient).permit(:first_name, :second_name, :last_name, :dni, :type_of_document, :date_of_birth, :membership, :user_id, phones_attributes:[:id, :number, :state])
    end
end
