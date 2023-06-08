class Doctor < ApplicationRecord
    acts_as_paranoid
    has_many :schedules, dependent: :destroy

    def to_s
        "#{first_name} #{last_name}"
    end
end
