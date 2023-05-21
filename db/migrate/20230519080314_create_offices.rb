class CreateOffices < ActiveRecord::Migration[7.0]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :code
      t.references :clinic, null: false, foreign_key: true

      t.timestamps
    end
    add_index :offices, :code, unique: true
    add_index :offices, :name
  end
end
