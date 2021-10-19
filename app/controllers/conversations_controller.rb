class ConversationsController < ApplicationController
  before_action :set_conversation, except: [:index]
  before_action :check_participating!, except: [:index]
  def index
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
  end

  def show
    pm = @conversation.personal_messages.last
    pm.update(read: nil)
    if pm.user != current_user
      pm.update(read: true)
      pm.save!
    end
    if pm.created_at != pm.updated_at && pm.read != true && pm.created_at > 2.seconds.ago
      mail = ConversationMailer.with(personal_message: pm).send_notification
      mail.deliver_now
    end

    @personal_message = PersonalMessage.new
  end

  private

  def set_conversation
    @conversation = Conversation.find_by(id: params[:id])
  end

  def check_participating!
    redirect_to root_path unless @conversation && @conversation.participates?(current_user)
  end
end
