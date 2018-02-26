class TripsController < ApplicationController

  before_action :set_trip, only: [:new, :create, :show, :edit, :update, :destroy]

  def index
    # @trips = Trip.all
    @trip = policy_scope(Trip)
  end

  def show
    authorize @trip
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    authorize @trip
    if @trip.save
      redirect_to trip_path(@trip), notice: "Your trip was successfuly created!"
    else
      render :new
    end
  end

  def destroy
  end

  def update
  end

  def edit
  end


private

  def set_trip
    @trip = Trip.find(params[:id])
  end

end
