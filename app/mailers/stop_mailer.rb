class StopMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.stop_mailer.validation.subject
  #
 def validation(stop)
    @stop = stop
    mail(to: @stop.traject.user.email, subject: 'nouvelle demande de covoiturage')
  end

end
