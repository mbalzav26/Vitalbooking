class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :code, null: false

      t.timestamps

    end
    add_index :doctors, :code, unique: true
    add_index :doctors, [:last_name, :first_name]
  end
end
