class BeerFeeling < ApplicationRecord
  belongs_to :beer
  belongs_to :feeling
end
