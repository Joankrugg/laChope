class Flavour < ApplicationRecord
  has_many :design_flavours
  has_many :designs, through: :design_flavours
  has_many :tasting_flavours
  has_many :tastings, through: :tasting_flavours
  has_many :typical_beer_flavours
  has_many :typical_beers, through: :typical_beer_flavours
  has_many :public_search_flavours
  has_many :public_searches, through: :public_search_flavours
  has_many :beer_flavours
  has_many :beers, through: :beer_flavours
end
