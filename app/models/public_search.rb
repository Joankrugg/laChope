class PublicSearch < ApplicationRecord
  belongs_to :category
  belongs_to :balance
  belongs_to :alcohol_shape
end
