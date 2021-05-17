class BeerFamily < ApplicationRecord
  has_many :typical_beers
  has_many :beers
end


