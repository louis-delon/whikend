class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @trip = Trip.find(params[trip_id])
    @review = Review.new(params_review)
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

  def user_was_in_trip
    @trip = Trip.find(params[trip_id])
    @users = []
    @users << @trip.submissions.user + @trip.user
    if

    end
  end

end
