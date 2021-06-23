class Beer < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  belongs_to :category, optional: true
  belongs_to :style, optional: true
  validates :name, presence: :true
  validates :photo, presence: :true
  has_many :recipes, dependent: :destroy
  has_many :fancies, dependent: :destroy
  has_many :users, through: :fancies
  has_many :ratings, dependent: :destroy
  has_many :users, through: :ratings
  has_many :tastings, dependent: :destroy
  has_many :users, through: :tastings
  belongs_to :beer_family
  belongs_to :typical_beer
  has_many :store_beers
  has_many :stores, through: :store_beers

  def average_stars
    star_number = tastings.map{ |t| t.global_rating }.select{ |gr|!gr.nil? }
    tasting_number = star_number.size > 0 ? star_number.sum.fdiv(star_number.size).round : 0
    ('<i class="fa fa-star" aria-hidden="true"></i>' * tasting_number + '<i class="fa fa-star-o" aria-hidden="true"></i>' * (5 - tasting_number)).html_safe
  end

end
