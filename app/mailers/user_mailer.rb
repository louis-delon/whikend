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

  def contact(message)
    @message = message
    @email = (ENV['EMAIL_CONTACT'] || "whikend@korium.com")

    mail to: @email, subject: "Contact de Whikend"
  end

  def new_message(message)
    @sender = User.find(message.user_id)
    @message = Message.find(message.id)
    @submissions = Submission.where(trip_id: @message.trip_id)

    @submissions.each do |submission|
      puts "------------"
      puts "send email to:"
      puts submission.user.email
      mail to: submission.user.email, subject: "Nouveau Message dans #{@message.trip.title}"
    end




    # @user = @message.trip.submission
    # @user.each do |user|
    # mail to: user.email, subject: "Nouveau Message Rando #{@trip.title}"
    # end
  end

end
