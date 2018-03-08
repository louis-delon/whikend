class TripsController < ApplicationController

  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = policy_scope(Trip).where('trips.date > ?', Date.today)
    @trips = @trips.where('trips.seats > ?', params[:seats]) if params[:seats].present?
    @trips = @trips.where(date: params[:date]) if params[:date].present?
    @trips = @trips.global_search(params[:query]) if params[:query].present?
    @title = "Whikend Search"
  end

  def show
    @submissions = @trip.submissions
    @messages = @trip.messages.order('created_at ASC')
    @message = Message.new
    @review = Review.where(trip_id: @trip).first
    @user = @trip.user
    @hike = Hike.find(@trip.hike_id)
    set_submission
    @title = "#{@trip.title} Whikend"

  end

  def new
    @trip = Trip.new
    authorize @trip
    @departments_list = []
    Hike.all.each { |hike| @departments_list << hike.department }
    @departments_list = @departments_list.uniq.sort
    @hikes = Hike.all.sort_by { |hike| hike.title }
    @trip_types = ["Chill", "Heavy walk", "Challenge", "Leisure", "Activities"]
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    authorize @trip
    if @trip.save
      redirect_to trip_path(@trip)
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

  def page_title
    @title || "erreur"
  end


  private

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def trip_params
    params.require(:trip).permit(:hike_id, :title, :start_location, :date, :trip_type, :seats, :description, :user_id, :auto_accept, :fees)
  end

  def set_submission
    @submission = Submission.find_or_initialize_by(trip: @trip, user: current_user)
  end


end
