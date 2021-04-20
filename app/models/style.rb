class Style < ApplicationRecord
  has_many :beers
  has_many :typical_beers
end
