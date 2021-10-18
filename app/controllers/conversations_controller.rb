class ConversationsController < ApplicationController
  before_action :set_conversation, except: [:index]
  before_action :check_participating!, except: [:index]
  def index
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
  end

  def show
    if @conversation.personal_messages.last.user != current_user
      @conversation.personal_messages.each do |pm|
        pm.update(read: true)
        pm.save!
      end
    else
      @conversation.personal_messages.last.update(read: false)
      @conversation.personal_messages.last.save!
    end
    if @conversation.personal_messages.last.read == false && @conversation.personal_messages.last.updated_at > 2.seconds.ago
      mail =  ConversationMailer.with(personal_message: @conversation.personal_messages.last).send_notification
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
