class TripsController < ApplicationController

  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    # @trips = Trip.all
    @trips = policy_scope(Trip).where('trips.date > ?', Date.today)
    @trips = @trips.where(date: params[:date]) if params[:date].present?
    @trips = @trips.global_search(params[:query]) if params[:query].present?
  end

  def show
    @submissions = @trip.submissions
    @messages = @trip.messages
    @message = Message.new
    @review = Review.where(trip_id: @trip).first
    @user = @trip.user
    new_submission
  end

  def new
    @trip = Trip.new
    authorize @trip
    @departments_list = []
    Hike.all.each { |hike| @departments_list << hike.department }
    @departments_list = @departments_list.uniq.sort
    @hikes = Hike.all.sort_by { |hike| hike.title }
    @trip_types = ["Chill", "Heavy walk", "Challenge", "Photo", "Activities"]
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
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

  def hikes_by_department
    @department = params[:department]
    @hikes = Hike.where department: @department
    authorize @hikes
    respond_to do |format|
      format.html {render 'trips/hikes_by_department', layout: false}
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def trip_params
    params.require(:trip).permit(:hike_id, :title, :start_location, :date, :trip_type, :seats, :description, :user_id, :auto_accept)
  end

  def new_submission
    @submission = Submission.new(trip: @trip, user: current_user)
    # @submission = Trip.submissions.build
  end


end
