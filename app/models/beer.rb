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
  has_many :fancies, dependent: :destroy
  has_many :users, through: :fancies
  has_many :ratings, dependent: :destroy
  has_many :users, through: :ratings
  has_many :tastings, dependent: :destroy
  has_many :users, through: :tastings

  def average_stars
    star_number = tastings.map{ |t| t.global_rating }.select{ |gr|!gr.nil? }
    tasting_number = star_number.size > 0 ? star_number.sum.fdiv(star_number.size).round : 0
    ('<i class="fa fa-star" aria-hidden="true"></i>' * tasting_number + '<i class="fa fa-star-o" aria-hidden="true"></i>' * (5 - tasting_number)).html_safe
  end
end
