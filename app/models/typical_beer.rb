class TypicalBeer < ApplicationRecord
  belongs_to :category
  belongs_to :style
  belongs_to :user
  belongs_to :beer_family
  has_one_attached :photo

end
