class MarketPlace < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
  has_one :store
  geocoded_by :city
  after_validation :geocode, if: :city_changed?
end
