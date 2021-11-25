class DraftsetBeer < ApplicationRecord
  belongs_to :draftset
  belongs_to :beer
end
