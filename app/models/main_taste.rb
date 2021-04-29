class MainTaste < ApplicationRecord
  has_many :designs
  has_many :tastings
  has_many :typical_beers
end
