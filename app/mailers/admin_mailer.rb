class AdminMailer < Devise::Mailer
  default from: 'modernboxrecords@gmail.com'
  layout 'mailer'

  def new_user_waiting_for_approval(email)
    @email = email
    mail(to: 'joan_krugg@live.fr', subject: 'Nouvel utilisateur sur le Beertrackr')
  end
end
