class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :first_name, null: false, default: ""
      t.string :second_name
      t.string :last_name, null: false, default: ""
      t.string :type_of_document, null: false, default: ""
      t.integer :dni, null: false, default: ""
      t.date :date_of_birth, null: false, default: ""
      t.string :membership, null: false, default: ""
      t.references :user, null: false, foreign_key: true
      t.datetime :deleted_at
      
      t.timestamps
    end
    add_index :patients, :deleted_at
    add_index :patients, :dni, unique: true
    add_index :patients, [:first_name, :second_name, :last_name]
  end
end
