class AddColumnToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :start, :timestamp
    add_column :appointments, :end, :timestamp
    add_column :appointments, :status, :string
    add_column :appointments, :title, :string
  end
end
