class ReviewsController < ApplicationController

  def new
    @trip     = Trip.find(params[:trip_id])
    @review   = Review.new
    @receiver = @trip.user
    authorize(@trip, :add_review?)
  end

  def create
    @trip   = Trip.find(params[:trip_id])
    @review = Review.new(params_review)
    authorize(@review)
    if @review.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def page_title
      "Whikend Reviews"
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
