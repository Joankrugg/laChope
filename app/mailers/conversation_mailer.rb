class ConversationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.conversation_mailer.notification.subject
  #
  def notification
    @store = params[:store]
    @user = @store.user
    mail(to: @user.email, subject: "Vous avez crée une cave!")
  end

  def send_notification
    @personal_message = params[:personal_message]
    @conversation = @personal_message.conversation
    users = []
    users << User.find_by_id(@conversation.author_id)
    users << User.find_by_id(@conversation.receiver_id)
    users.each do |u|
      if u != @personal_message.user
        @user = u
      end
    end
    unless @conversation.read?
      mail(to: @user.email, subject: "Vous avez reçu un message!")
    end
  end
end
