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

  def select(submission)
    @user = User.find(submission.user_id)
    @trip = Trip.find(submission.trip_id)

    mail to: @user.email, subject: "Confirmation participation Rando #{@trip.title}"
  end

  def reject(submission)
    @user = User.find(submission.user_id)
    @trip = Trip.find(submission.trip_id)

    mail to: @user.email, subject: "Refus Rando"
  end

  def send_reminders(email)
    mail to: email, subject: "Rappel: Votre Rando de demaain"
  end
end
