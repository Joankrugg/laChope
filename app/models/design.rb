class Design < ApplicationRecord
  belongs_to :user
  belongs_to :alcohol_shape, optional: true
  belongs_to :main_taste, optional: true
  belongs_to :balance, optional: true
  belongs_to :category, optional: true
  belongs_to :design_color, optional: true
  has_many :design_flavours, :dependent => :destroy
  has_many :flavours, through: :design_flavours
  has_many :design_feelings, :dependent => :destroy
  has_many :feelings, through: :design_feelings
end
