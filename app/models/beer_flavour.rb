class BeerFlavour < ApplicationRecord
  belongs_to :beer
  belongs_to :flavour
end
