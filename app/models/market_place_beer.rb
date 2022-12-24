class MarketPlaceBeer < ApplicationRecord
  belongs_to :market_place
  belongs_to :beer
end
