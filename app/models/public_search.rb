class PublicSearch < ApplicationRecord
  belongs_to :category
  belongs_to :balance
  belongs_to :alcohol_shape
  belongs_to :design_color
  belongs_to :main_taste
  has_many :public_search_feelings
  has_many :feelings, through: :public_search_feelings
  has_many :public_search_flavours
  has_many :flavours, through: :public_search_flavours
end
