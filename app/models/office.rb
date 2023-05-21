class Office < ApplicationRecord
  belongs_to :clinic
  has_many :schedules, dependent: :destroy
end
