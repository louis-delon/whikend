class TripsController < ApplicationController


  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    # @trips = Trip.all
    @trips = policy_scope(Trip)
  end

  def show
    @submissions = @trip.submissions
    @messages = @trip.messages
    @review = Review.where(trip_id: @trip).first
    new_submission
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    authorize @trip
    if @trip.save
      redirect_to trip_path(@trip), notice: "Your trip was successfuly created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @trip.update(trip_params)
    redirect_to trip_path(@trip), notice: "Your trip was successfuly updated!"
  end

  def destroy
    @trip.destroy
    redirect_to root_path
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def trip_params
    params
      .require(:trip)
      .permit(
        :date,
        :title,
        :description,
        :location,
        :user_id,
        :hike_id
      )
  end

  def new_submission
    @submission = Submission.new(trip: @trip, user: current_user)
    # @submission = Trip.submissions.build
  end

end
