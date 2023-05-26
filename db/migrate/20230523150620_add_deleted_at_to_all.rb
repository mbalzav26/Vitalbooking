class AddDeletedAtToAll < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :deleted_at, :datetime
    add_column :phones, :deleted_at, :datetime
    add_column :clinics, :deleted_at, :datetime
    add_column :doctors, :deleted_at, :datetime
    add_column :offices, :deleted_at, :datetime
    add_column :schedules, :deleted_at, :datetime
    add_column :appointments, :deleted_at, :datetime
  
    add_index :users, :deleted_at
    add_index :phones, :deleted_at
    add_index :clinics, :deleted_at
    add_index :doctors, :deleted_at
    add_index :offices, :deleted_at
    add_index :schedules, :deleted_at
    add_index :appointments, :deleted_at
  end
end
