class AlcoholShape < ApplicationRecord
  has_many :designs
  has_many :typical_beers
  has_many :public_searches
end
