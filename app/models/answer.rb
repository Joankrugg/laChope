class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :publication
  has_one_attached :photo
  has_one_attached :video
end
