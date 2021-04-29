class Feeling < ApplicationRecord
  has_many :design_feelings
  has_many :designs, through: :design_feelings
  has_many :tasting_feelings
  has_many :tastings, through: :tasting_feelings
  has_many :typical_beer_feelings
  has_many :typical_beers, through: :typical_beer_feelings
end
