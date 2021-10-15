class ConversationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.conversation_mailer.notification.subject
  #
  def notification
    @personal_message = params[:personal_message]
    @user = @personal_message.user
    mail(to: @user.email, subject: "Vous envoyez un message!")
  end
end
