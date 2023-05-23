class OfficesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clinic
  before_action :set_office, only: %i[show edit update destroy]
  
  def index
    @offices = @clinic.offices.all
  end

  def new
    @office = @clinic.offices.build
  end

  def create
    @office = @clinic.offices.build(office_params)
    respond_to do |format|
      if @office.save
        format.turbo_stream
        format.html { redirect_to [@clinic, @office], notice: 'Office was successfully created.' }
      end
    end
  end

  def edit
  end

  def destroy
    if @office.destroy
      redirect_to clinic_offices_path(@clinic), notice: 'Office was successfully destroyed.'
    else
      redirect_to clinic_offices_path(@clinic), notice: 'Office was not destroyed.'
    end
  end

  private

  def set_clinic
    @clinic = Clinic.find(params[:clinic_id])
  end

  def set_office
    @office = @clinic.offices.find(params[:id])
  end

  def office_params
    params.require(:office).permit(:name, :code, :clinic_id)
  end

end
