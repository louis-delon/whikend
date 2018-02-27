class SubmissionController < ApplicationController

  def index
    @submission = policy_scope(Submission)
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submission_params)
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

private

  def
    params
      .require(:submission)
      .permit(
        :content,
        :user_id,
        :trip_id
        )
  end

end
