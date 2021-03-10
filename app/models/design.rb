class Design < ApplicationRecord
  belongs_to :user
  belongs_to :alcohol_shape
  belongs_to :main_taste
end
