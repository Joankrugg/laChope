class MailAlert < ApplicationRecord
  belongs_to :personal_message
  after_create :notification

  def notification
    ConversationMailer.with(mail_alert: self).send_notification.deliver_now
  end
end
