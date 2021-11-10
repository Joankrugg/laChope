class Publication < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_one_attached :photo
  has_one_attached :video
  validates :content, presence: true, allow_blank: true
end
