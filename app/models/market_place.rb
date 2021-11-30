class MarketPlace < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
  has_one :store
  belongs_to :market_style, optional: true
  geocoded_by :city
  after_validation :geocode, if: :city_changed?
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :city ],
    using: {
      tsearch: { prefix: true, any_word: true } # <-- now `superman batm` will return something!
    }

end
