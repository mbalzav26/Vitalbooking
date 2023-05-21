class CreateClinics < ActiveRecord::Migration[7.0]
  def change
    create_table :clinics do |t|
      t.string :name, null: false, default: ""
      t.string :address
      t.string :street
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
    add_index :clinics, :street
    add_index :clinics, :city
    add_index :clinics, :state
    add_index :clinics, :name
  end
end
