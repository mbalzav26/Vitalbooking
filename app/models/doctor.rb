class Doctor < ApplicationRecord
    has_many :schedules, dependent: :destroy
end
