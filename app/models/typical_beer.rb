class TypicalBeer < ApplicationRecord
  belongs_to :category
  belongs_to :style
  belongs_to :user
  belongs_to :beer_family
  belongs_to :design_color
  belongs_to :balance
  belongs_to :alcohol_shape
  belongs_to :main_taste, optional: true
  has_many :typical_beer_flavours, dependent: :destroy
  has_many :flavours, through: :typical_beer_flavours
  has_many :typical_beer_feelings, dependent: :destroy
  has_many :feelings, through: :typical_beer_feelings
  has_many :beers
  has_one_attached :photo
  has_many :projects
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name ],
    associated_against: {
      style: [ :name ],
      category: [ :name ],
      design_color: [ :name ],
      beer_family: [ :name ],
      main_taste: [ :name ],
      alcohol_shape: [ :name ],
      balance: [ :name ],
      flavours: [ :name ],
      feelings: [ :name ],
    },
    using: {
      tsearch: { prefix: true, any_word: true } # <-- now `superman batm` will return something!
    }

end
