class Article < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_one_attached :photo
  validates :photo, presence: true
end
