require 'csv'
class Beer < ApplicationRecord
  belongs_to :user
  acts_as_favoritable
  has_one_attached :photo
  belongs_to :category, optional: true
  belongs_to :style, optional: true
  validates :name, presence: :true, uniqueness: true
  validates :photo, presence: :true
  has_many :recipes, dependent: :destroy
  has_many :fancies, dependent: :destroy
  has_many :users, through: :fancies
  has_many :ratings, dependent: :destroy
  has_many :users, through: :ratings
  has_many :tastings, dependent: :destroy
  has_many :users, through: :tastings
  has_many :tasting_places, dependent: :destroy
  belongs_to :beer_family
  belongs_to :typical_beer
  belongs_to :design_color, optional: true
  belongs_to :alcohol_shape, optional: true
  belongs_to :balance, optional: true
  belongs_to :main_taste, optional: true
  has_many :store_beers, dependent: :destroy
  has_many :stores, through: :store_beers
  has_many :draftset_beers, dependent: :destroy
  has_many :draftsets, through: :draftset_beers
  has_many :beer_flavours, dependent: :destroy
  has_many :flavours, through: :beer_flavours
  has_many :beer_feelings, dependent: :destroy
  has_many :feelings, through: :beer_feelings
  has_many :users, through: :ratings
  has_many :market_place_beers, dependent: :destroy
  has_many :market_places, through: :market_place_beers

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name ],
    associated_against: {
      typical_beer: [ :name ]
    },
    using: {
      tsearch: { prefix: true, any_word: true } # <-- now `superman batm` will return something!
    }

  pg_search_scope :color_search,
    against: [:name],
    using: {
      tsearch: { prefix: true, any_word: true } # <-- now `superman batm` will return something!
    }



  def average_stars
    star_number = tastings.map{ |t| t.global_rating }.select{ |gr|!gr.nil? }
    tasting_number = star_number.size > 0 ? star_number.sum.fdiv(star_number.size).round : 0
    ('<i class="fa fa-star" aria-hidden="true"></i>' * tasting_number + '<i class="fa fa-star-o" aria-hidden="true"></i>' * (5 - tasting_number)).html_safe
  end

end
