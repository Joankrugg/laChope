class Recipe < ApplicationRecord
  belongs_to :beer
  belongs_to :unit, optional: true
  validates :step, presence: true
end
