class Tasting < ApplicationRecord
  belongs_to :beer
  belongs_to :user
  has_many :tasting_flavours
  has_many :flavours, through: :tasting_flavours
end
