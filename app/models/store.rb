class Store < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :website, presence: true
  validates :privacy_code, presence: true
  has_many :store_beers, dependent: :destroy
  has_many :beers, through: :store_beers
  after_create :store_notification
  private

  def store_notification
    ConversationMailer.with(store: self).notification.deliver_now
  end
end
