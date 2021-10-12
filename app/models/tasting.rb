class Tasting < ApplicationRecord
  belongs_to :beer
  belongs_to :user
  has_many :tasting_flavours, dependent: :destroy
  has_many :flavours, through: :tasting_flavours
  has_many :tasting_feelings, dependent: :destroy
  has_many :feelings, through: :tasting_feelings
  belongs_to :balance
  belongs_to :main_taste
  belongs_to :design_color
  belongs_to :weather
  belongs_to :context
  validates :date, presence: true
  validates :global_rating, presence: true
  validates :flavours, presence: true
  validates :balance, presence: true
  validates :main_taste, presence: true
  validates :design_color, presence: true
  validates :weather, presence: true
  validates :context, presence: true
  validates :feelings, presence: true
end
