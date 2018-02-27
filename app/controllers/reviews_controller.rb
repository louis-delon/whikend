class ReviewsController < ApplicationController

  def new
    @trip = Trip.find(params[trip_id])
    @receiver_id = @trip.user
    @review = Review.new(@receiver_id)
  end

  def create
    @trip = Trip.find(params[trip_id])
    @sender_id = current_user
    @receiver_id = @trip.user
    @review = Review.new(params_review)
    authorize(@review)

    if @review.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  private

  def params_review
    params.require(:review)
    .permit(
      :content,
      :rating,
      :sender_id,
      :receiver_id
       )
  end

end
