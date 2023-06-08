# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Crear usuarios y clínicas para las citas
# user1 = User.create(name: "Usuario 1")
# user2 = User.create(name: "Usuario 2")
# clinic1 = Clinic.create(name: "Clínica 1")
# clinic2 = Clinic.create(name: "Clínica 2")

# Crear citas
Appointment.create(
  appointment_date: DateTime.new(2023, 6, 15, 9, 0, 0),
  reason: "Dolor de cabeza, mareos, náuseas",
  user_id: 1,
  clinic_id: 28,
  start: DateTime.new(2023, 6, 15, 9, 0, 0),
  end: DateTime.new(2023, 6, 15, 10, 0, 0),
  title: "Migraña y otros síntomas",
  status: "pending"
)

Appointment.create(
  appointment_date: DateTime.new(2023, 6, 16, 14, 30, 0),
  reason: "Fiebre, tos, dolor de garganta",
  user_id: 1,
  clinic_id: 28,
  start: DateTime.new(2023, 6, 16, 14, 30, 0),
  end: DateTime.new(2023, 6, 16, 15, 30, 0),
  title: "Sospecha de COVID-19",
  status: "pending"
)

Appointment.create(
    appointment_date: DateTime.new(2023, 6, 17, 11, 0, 0),
    reason: "Dolor de espalda, dolor de piernas",
    user_id: 1,
    clinic_id: 28,
    start: DateTime.new(2023, 6, 17, 11, 0, 0),
    end: DateTime.new(2023, 6, 17, 12, 0, 0),
    title: "Dolor muscular",
    status: "approved"
)

# Otras citas...

puts "Se han creado las citas."
