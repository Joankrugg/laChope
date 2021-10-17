class PersonalMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  has_one_attached :photo
  validates :body, presence: true, allow_blank: true
  after_save :notification

  private

  def notification
    if self.read == false
      ConversationMailer.with(personal_message: self).send_notification.deliver_now
    end
  end
end

