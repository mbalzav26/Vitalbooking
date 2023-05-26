class Clinic < ApplicationRecord
  acts_as_paranoid
    #broadcasts con turbo de este modelo
    #eliminar en tiempo real un registro
    broadcasts_to ->(clinic) { :clinic_list }, target: 'clinic_list'

    has_many :offices, dependent: :destroy
    geocoded_by :address
    after_validation :geocode
    # broadcasts_to :clinic, target: 'clinic_list'

  # Otros atributos y relaciones del modelo

  def address
    # Retorna la dirección completa de la clínica
    "#{street}"
  end

  def eliminar
    destroy
  end

  def restaurar
    restore
  end

end
