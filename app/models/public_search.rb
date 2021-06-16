class PublicSearch < ApplicationRecord
  belongs_to :category
  belongs_to :balance
  belongs_to :alcohol_shape
  belongs_to :design_color
  belongs_to :main_taste
end
