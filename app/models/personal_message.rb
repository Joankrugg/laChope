class PersonalMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  has_one_attached :photo
  validates :body, presence: true, allow_blank: true
  after_commit :notification


  private

  def notification
    unless self.conversation.read?
      ConversationMailer.with(personal_message: self).send_notification.deliver_now
    end
  end

end

