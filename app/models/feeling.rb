class Feeling < ApplicationRecord
  has_many :design_feelings
  has_many :designs, through: :design_feeling
end
