class Design < ApplicationRecord
  belongs_to :user
  belongs_to :alcohol_shape
  belongs_to :main_taste
  has_many :design_flavours
  has_many :flavours, through: :design_flavours
end
