class Doctor < ApplicationRecord
    acts_as_paranoid
    has_many :schedules, dependent: :destroy
end
