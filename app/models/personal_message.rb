class PersonalMessage < ApplicationRecord
  include ActiveModel::Dirty
  belongs_to :conversation
  belongs_to :user
  has_one_attached :photo
  validates :body, presence: true, allow_blank: true

  after_create :notification

  def notification
    ConversationMailer.with(personal_message: self).send_notification.deliver_now
  end

end


