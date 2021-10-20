class PersonalMessage < ApplicationRecord
  include ActiveModel::Dirty
  belongs_to :conversation
  belongs_to :user
  has_one_attached :photo
  validates :body, presence: true, allow_blank: true
  has_one :mail_alert, dependent: :destroy
end


