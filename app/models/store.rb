class Store < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :website, presence: true
end
