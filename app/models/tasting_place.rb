class TastingPlace < ApplicationRecord
  belongs_to :beer
  belongs_to :market_place
end
