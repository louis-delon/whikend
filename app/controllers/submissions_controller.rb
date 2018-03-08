class SubmissionsController < ApplicationController

  before_action :set_params, only: [:destroy, :approve, :reject]

  def index
    @submission = policy_scope(Submission)
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @submission = Submission.new
    authorize @submission
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @submission = Submission.new(trip: @trip, user: current_user)
    # @submission.trip = @trip
    # @submission.user = current_user
    authorize @submission
    @submission.accepted = true if @trip.auto_accept
    if @submission.save
      redirect_to trip_path(params[:trip_id])
    else
      render :new
    end
  end

  def destroy
    @submission.destroy
    redirect_to root_path
  end

  def approve
    @submission.accepted = true
    UserMailer.select(@submission).deliver_now
    save_submission
  end

  def reject
    @submission.accepted = false
    UserMailer.reject(@submission).deliver_now
    save_submission
  end

private

  def set_params
    @submission = Submission.find(params[:id])
    authorize @submission
  end

  def save_submission
    @submission.save
    redirect_to trip_path(params[:trip_id])
  end
end
