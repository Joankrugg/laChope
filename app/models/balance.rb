class Balance < ApplicationRecord
  has_many :designs
  has_many :tastings
end
