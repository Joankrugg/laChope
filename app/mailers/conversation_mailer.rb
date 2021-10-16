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
end
