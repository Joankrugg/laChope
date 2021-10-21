class MarketPlace < ApplicationRecord
  validates :name, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
end
