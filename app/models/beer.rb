class Beer < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  belongs_to :category
  belongs_to :style
  validates :name, presence: :true
  validates :photo, presence: :true
  validates :style, presence: :true
  validates :alcohol_level, presence: :true
  validates :color, presence: :true
  validates :bitterness, presence: :true
  validates :description, presence: :true
  validates :photo, presence: :true
  validates :category, presence: :true
  has_many :recipes
  has_many :fancies
  has_many :users, through: :fancies
  has_many :ratings
  has_many :users, through: :ratings
  has_many :tastings
  has_many :users, through: :tastings
end
