class Store < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :website, presence: true
  validates :privacy_code, presence: true
  has_many :store_beers
  has_many :beers, through: :store_beers
end
