class MessagesController < ApplicationController


  def new
    @trip = Trip.find(params[:trip_id])
    @message = Message.new
    authorize @message
  end

  def create
    @message = Message.new(message_params)
    @trip = Trip.find(params[:trip_id])
    @message.trip = @trip
    @message.user = current_user
    authorize @message
    @message.save
    UserMailer.new_message(@message).deliver_now
    @new_message = Message.new
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
