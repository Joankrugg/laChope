class PersonalMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  has_one_attached :photo
  validates :body, presence: true, allow_blank: true
  after_create :notification

  private

  def notification
    ConversationMailer.with(personal_message: self).send_notification.deliver_now
  end
end

