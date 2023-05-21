class AddCoordenadasToClinic < ActiveRecord::Migration[7.0]
  def change
    add_column :clinics, :latitude, :decimal, precision: 10, scale: 6
    add_column :clinics, :longitude, :decimal, precision: 10, scale: 6
  end
end
  