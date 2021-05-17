class Sticker < ApplicationRecord

  belongs_to :user
  validates :name, presence: true
  validates :photo, presence: true
  has_one_attached :photo
  has_many :projects

end
