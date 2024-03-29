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
    end
    @personal_message = PersonalMessage.new
    @mail_alert = MailAlert.new
  end

  private

  def set_conversation
    @conversation = Conversation.find_by(id: params[:id])
  end

  def check_participating!
    redirect_to root_path unless @conversation && @conversation.participates?(current_user)
  end
end
