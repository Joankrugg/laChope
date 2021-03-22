class Flavour < ApplicationRecord
  has_many :design_flavours
  has_many :designs, through: :design_flavour
  has_many :tasting_flavours
  has_many :flavours, through: :tasting_flavours
end
