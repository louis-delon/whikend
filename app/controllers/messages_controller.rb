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
    if @message.save
      redirect_to trip_path(params[:trip_id]), notice: "Your message was successfuly send!"
    else
      render :new
    end
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
