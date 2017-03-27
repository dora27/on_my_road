class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.validation.subject
  #
  def validation(user)
    @user = user

    mail(to: @user.email, subject: 'nouvelle demande de covoiturage')
  end

end
