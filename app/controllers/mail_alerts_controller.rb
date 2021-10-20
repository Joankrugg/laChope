class MailAlertsController < ApplicationController
  before_action :authenticate_user!
  def new
    @personal_message = PersonalMessage.find(params[:personal_message_id])
    @mail_alert = MailAlert.new
  end

  def create
    @personal_message = PersonalMessage.find(params[:personal_message_id])
    @mail_alert = MailAlert.new(mail_alert_params)
    # we need `restaurant_id` to associate mail_alert with corresponding restaurant
    @mail_alert.personal_message = @personal_message
    if
      @mail_alert.save!
      redirect_to conversation_path(@personal_message.conversation)
    else
      render :new
    end
  end

  private

  def mail_alert_params
    params.require(:mail_alert).permit(:mail_notification)
  end
end
