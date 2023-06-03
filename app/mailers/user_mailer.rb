class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  # def welcome
  #   @greeting = "Hi"

  #   mail to: "to@example.org"
  # end
  def welcome(user)
    @user = User.last
    mail(to: @user.email, subject:'¡Bienvenido a VitalBooking!')
  end

end
