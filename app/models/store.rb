class Store < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :website, presence: true
  validates :privacy_code, presence: true
  has_many :store_beers, dependent: :destroy
  has_many :beers, through: :store_beers
  belongs_to :market_place, optional: true
  after_create :store_notification
  has_one :draftset, dependent: :destroy
  private

  def store_notification
    ConversationMailer.with(store: self).notification.deliver_now
  end
end
