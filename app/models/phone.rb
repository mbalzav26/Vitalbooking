class Phone < ApplicationRecord
  acts_as_paranoid
  belongs_to :phoneable, polymorphic: true
end
