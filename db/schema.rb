# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_25_232527) do
  create_table "appointments", force: :cascade do |t|
    t.datetime "appointment_date", null: false
    t.text "reason", default: "", null: false
    t.integer "user_id", null: false
    t.integer "clinic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["clinic_id"], name: "index_appointments_on_clinic_id"
    t.index ["deleted_at"], name: "index_appointments_on_deleted_at"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "address"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.datetime "deleted_at"
    t.index ["city"], name: "index_clinics_on_city"
    t.index ["deleted_at"], name: "index_clinics_on_deleted_at"
    t.index ["name"], name: "index_clinics_on_name"
    t.index ["state"], name: "index_clinics_on_state"
    t.index ["street"], name: "index_clinics_on_street"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["code"], name: "index_doctors_on_code", unique: true
    t.index ["deleted_at"], name: "index_doctors_on_deleted_at"
    t.index ["last_name", "first_name"], name: "index_doctors_on_last_name_and_first_name"
  end

  create_table "offices", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.integer "clinic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["clinic_id"], name: "index_offices_on_clinic_id"
    t.index ["code"], name: "index_offices_on_code", unique: true
    t.index ["deleted_at"], name: "index_offices_on_deleted_at"
    t.index ["name"], name: "index_offices_on_name"
  end

  create_table "phones", force: :cascade do |t|
    t.integer "number"
    t.string "state"
    t.string "phoneable_type"
    t.integer "phoneable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_phones_on_deleted_at"
    t.index ["phoneable_id"], name: "index_phones_on_phoneable_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.integer "doctor_id", null: false
    t.integer "office_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_schedules_on_deleted_at"
    t.index ["doctor_id"], name: "index_schedules_on_doctor_id"
    t.index ["office_id"], name: "index_schedules_on_office_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.date "date_of_birth"
    t.integer "dni", null: false
    t.string "type_of_document", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["dni"], name: "index_users_on_dni", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["last_name", "first_name"], name: "index_users_on_last_name_and_first_name"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "appointments", "clinics"
  add_foreign_key "appointments", "users"
  add_foreign_key "offices", "clinics"
  add_foreign_key "schedules", "doctors"
  add_foreign_key "schedules", "offices"
end
