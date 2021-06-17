class PublicSearchFlavour < ApplicationRecord
  belongs_to :flavour
  belongs_to :public_search
end
