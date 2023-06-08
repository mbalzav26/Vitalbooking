class Patient < ApplicationRecord
  belongs_to :user
   has_many :phones, as: :phoneable
end
