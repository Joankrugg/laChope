class BottleTop < ApplicationRecord
  has_one_attached :photo
  has_many :packs
end
