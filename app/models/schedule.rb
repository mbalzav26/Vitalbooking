class Schedule < ApplicationRecord
  acts_as_paranoid
  belongs_to :doctor
  belongs_to :office
end
