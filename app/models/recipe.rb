class Recipe < ApplicationRecord
  belongs_to :beer
  belongs_to :unit, optional: true
  belongs_to :action, optional: true
  belongs_to :duration_unit, optional: true
  belongs_to :product_type, optional: true
  validates :step, presence: true
end
