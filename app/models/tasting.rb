class Tasting < ApplicationRecord
  belongs_to :beer
  belongs_to :user
  has_many :tasting_flavours
  has_many :flavours, through: :tasting_flavours
  has_many :tasting_feelings
  has_many :feelings, through: :tasting_feelings
  belongs_to :balance
  belongs_to :main_taste
  belongs_to :design_color
end
