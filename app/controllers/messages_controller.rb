class MessagesController < ApplicationController


  def new
    @trip = Trip.find(params[:trip_id])
    @message = Message.new
    authorize @message
  end

  def create
    puts "-----"
    puts "Que passa??? nada"
    @message       = Message.new(message_params)
    @trip          = Trip.find(params[:trip_id])
    @message.trip  = @trip
    @message.user  = current_user
    authorize @message
    @message.save
    @submissioners = Submission.where(trip_id: params[:trip_id])
    puts "Print submissioners"
    p @submissioners
    # Message aux participants
    @submissioners.each do |submissioner|
      UserMailer.new_message(@message, submissioner).deliver_now
    end
    # Message à l'organisateur
    p @trip
    UserMailer.new_message(@message, @trip).deliver_now
    @new_message   = Message.new
  end

  def page_title
      "Whikend Messages"
  end

private

  def message_params
    params
      .require(:message)
      .permit(
        :content,
        :user_id,
        :trip_id
      )
  end

end

