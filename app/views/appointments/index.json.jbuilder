json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :appointment_date, :clinic_id, :user_id, :start, :end, :title, :status, :reason
end
