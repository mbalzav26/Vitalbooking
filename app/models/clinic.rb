class Clinic < ApplicationRecord
    has_many :offices, dependent: :destroy
    geocoded_by :address
    after_validation :geocode

  # Otros atributos y relaciones del modelo

  def address
    # Retorna la dirección completa de la clínica
    "#{street}, #{city}, #{state}, #{country}"
  end
end
