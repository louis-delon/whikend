class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user

    mail to: @user.email, subject: "Welcome to Whikend"
  end

  def create_hike(user)
    @user = user

    mail to: @user.email, subject: "Nouvelle Rando"
  end

  def select(user)
    @user = user

    mail to: @user.email, subject: "Participation Rando"
  end

  def reject(user)
    @user = user

    mail to: @user.email, subject: "Refus Rando"
  end

end
