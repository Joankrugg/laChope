class StoreBeer < ApplicationRecord
  belongs_to :beer
  belongs_to :store
end
