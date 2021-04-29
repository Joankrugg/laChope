class TypicalBeer < ApplicationRecord
  belongs_to :category
  belongs_to :style
  belongs_to :user
  belongs_to :beer_family
  belongs_to :design_color
  belongs_to :balance
  belongs_to :alcohol_shape
  belongs_to :main_taste
  has_one_attached :photo

end
