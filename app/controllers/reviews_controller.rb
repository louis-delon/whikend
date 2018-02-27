class ReviewsController < ApplicationController

  def new
    @trip = Trip.find(params[trip_id])
    @receiver_id = @trip.user
    @review = Review.new(@receiver_id)
  end

  def create
    @trip = Trip.find(params[trip_id])
    @review = Review.new(params_review)
    authorize(@review)
    @sender_id = current_user
    @receiver_id = @trip.user

    if @review.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  private

  def params_review
    params.require(:review).permit(:content, :rating)
  end

end
