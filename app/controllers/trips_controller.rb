class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @trips = policy_scope(Trip).where('trips.date > ?', Date.today)
    @trips = @trips.where('trips.seats > ?', params[:seats]) if params[:seats].present?
    @trips = @trips.where(date: params[:date]) if params[:date].present?
    @trips = @trips.global_search(params[:query]) if params[:query].present?
    # @trips = Trip.near(params[:start_location], 20) # Les trips 20 km aux alentours de la start location.
    @markers = @trips.map do |trip|
      {
        lat = trip.latitude,
        lng = trip.longitude
        infowindow = trip.title
      }
    end
    @title = "Whikend | Search results"
  end

  def show
    @submissions     = @trip.submissions
    @messages        = @trip.messages.order('created_at ASC')
    @message         = Message.new
    @review          = Review.where(trip_id: @trip).first
    @user            = @trip.user
    @hike            = Hike.find(@trip.hike_id)
    @title           = "Whikend | #{@trip.title}"
    # On crée une fausse particpation pour le créateur de la rando
    # Afin qu'il apparaisse dans la liste des inscrits!!
    @submission      = Submission.new
    @submission.user = current_user
    @submission.trip = @trip
  end

  def new
    @trip             = Trip.new
    authorize @trip
    @departments_list = []
    Hike.all.each     { |hike| @departments_list << hike.department }
    @departments_list = @departments_list.uniq.sort
    @hikes            = Hike.all.sort_by { |hike| hike.title }
    @trip_types       = ["Détente", "Soutenue", "Sportive", "Loisir", "Activities"]
    # La liste des categories est désormais stocké dans la model Trip
+   # @trip_types       = Trip.categories
    @title            = "Whikend | Create a new trip"
  end

  def create
    @trip      = Trip.new(trip_params)
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
    redirect_to trip_path(@trip), notice: "Votre sortie a été mise à jour!"
  end

  def destroy
    @trip.destroy
    redirect_to root_path
  end

  def hikes_by_department
    @department = params[:department]
    @hikes      = Hike.where department: @department
    authorize @hikes
    respond_to do |format|
      format.html {render 'trips/hikes_by_department', layout: false}
    end
  end

  def page_title
    @title || "Whikend"
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end

  def trip_params
    params.require(:trip)
    .permit(
      :hike_id,
      :title,
      :start_location,
      :date,
      :trip_type,
      :seats,
      :description,
      :user_id,
      :auto_accept,
      :fees
    )
  end

end
