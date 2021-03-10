class Flavour < ApplicationRecord
  has_many :design_flavours
  has_many :designs, through: :design_flavour
end
