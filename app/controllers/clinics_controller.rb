class ClinicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clinic, only: %i[show edit update destroy]

  def index
    @clinics = Clinic.all
  end

  def new
    @clinic = Clinic.new
  end

  def create
    @clinic = Clinic.create(clinic_params)
    respond_to do |format|
      if @clinic.save
        format.turbo_stream
        format.html { resdirect_to clinics_path, notice: "Clinica registrada" }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@clinic, partial: "clinics/form", locals: { clinic: @clinic }) }
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update

  end

  def destroy
    if @clinic.destroy
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@clinic) }
        format.html { redirect_to clinics_path, notice: "Clinica eliminada" }
      end
    end
  end

  private

  def set_clinic
    @clinic = Clinic.find(params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(:name, :street, :city, :state)
  end

end
