class CreatePhones < ActiveRecord::Migration[7.0]
  def change
    create_table :phones do |t|
      t.integer :number, unique: true
      t.string :state
      t.string :phoneable_type
      t.integer :phoneable_id

      t.timestamps
    end

    add_index :phones, :phoneable_id
  end
end
