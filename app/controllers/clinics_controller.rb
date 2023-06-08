class ClinicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clinic, only: %i[edit update destroy]

  def index
    @clinics = Clinic.all
  end

  def show
    @clinics = Clinic.with_deleted
  end

  def new
    @clinic = Clinic.new
  end

  def create
    @clinic = Clinic.create(clinic_params)
    respond_to do |format|
      if @clinic.save
        # format.turbo_stream)
        format.html { redirect_to clinics_path, notice: "Clinica registrada" }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@clinic, partial: "clinics/form", locals: { clinic: @clinic }) }
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @clinic.update(clinic_params)
        # format.turbo_stream { render turbo_stream: turbo_stream.replace(@clinic, partial: "clinics/clinic", locals: { clinic: @clinic }) }
        format.html { redirect_to clinics_path, notice: 'La clínica ha sido actualizada.'}
      else
        render :edit
      end
    end
  end

def restore
  @clinic = Clinic.with_deleted.find(params[:id])
  @clinic.restore

  redirect_to clinics_path, notice: 'La clínica ha sido restaurada.'
end


  def delete_by_get
    clinic = Clinic.find(params[:id])
    clinic.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to clinics_path, notice: 'La clínica ha sido eliminada.' }
    end
    # redirect_to clinics_path, notice: 'La clínica ha sido eliminada.'
    # Turbo::StreamsChannel.broadcast_replace_to('clinics', target: "clinic_#{clinic.id}", template: 'clinics/destroy')
  end

  private

  def set_clinic
    @clinic = Clinic.find(params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(:name, :street, :city, :state, :deleted_at)
  end

end
