class PersonalMessage < ApplicationRecord
  include ActiveModel::Dirty
  belongs_to :conversation
  belongs_to :user
  has_one_attached :photo
  validates :body, presence: true, allow_blank: true

  def notification
    conversation = self.conversation
    if self == conversation.personal_messages.last && self.read != true && self.created_at > 2.seconds.ago
      ConversationMailer.with(personal_message: self).send_notification.deliver_now
    end
  end

end


