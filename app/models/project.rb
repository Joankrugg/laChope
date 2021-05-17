class Project < ApplicationRecord
  belongs_to :pack
  belongs_to :typical_beer
  belongs_to :sticker
  belongs_to :bottle_top
  belongs_to :user
end
