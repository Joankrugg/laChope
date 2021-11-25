class Draftset < ApplicationRecord
  has_many :draftset_beers, dependent: :destroy
  has_many :beers, through: :draftset_beers
  belongs_to :store
end
