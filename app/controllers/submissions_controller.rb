class SubmissionsController < ApplicationController

  def index
    @submission = policy_scope(Submission)
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @submission = Submission.new
    authorize @submission
  end

  def create
    @submission = Submission.new(submission_params)
    @trip = Trip.find(params[:trip_id])
    @submission.trip = @trip
    @submission.user = current_user
    authorize @submission
    if @submission.save
      redirect_to trip_path(params[:trip_id]), notice: "Your submission was successfuly send!"
    else
      render :new
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    authorize @submission
    @submission.destroy
    redirect_to root_path
  end

  def select
    @submission = Submission.find(params[:id])
    @submission.accepted = true
    @submission.save
    authorize @submission
    redirect_to trip_path(params[:trip_id])
  end

private

  def submission_params
    params
      .require(:submission)
      .permit(
        :content,
        :user_id,
        :trip_id
      )
  end

end
