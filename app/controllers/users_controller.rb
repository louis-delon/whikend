class UsersController < ApplicationController

before_action :set_user, only: [:show, :edit, :update]

  def show
    @average = calcul_average_rating(@user)
    @trips = trips_user_list(@user)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def page_title
    "Whikend | #{@user.first_name} #{@user.last_name}"
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize(@user)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :email, :description)
  end

  def calcul_average_rating(user)
    #calculates the average rating for a user
    @ratings = []
    @reviews = user.reviews
    @reviews.each { |review| @ratings << review.rating }
    @ratings.sum.fdiv(@ratings.count).round(1)
  end

  def trips_user_list(user)
    #gives an array of total trips in which the user is involved (submitted and created)
    @trips_created_list = user.trips
    @submission_list = user.submissions
    @trips_submitted_list = @submission_list.map { |submission_trip| submission_trip.trip }
    @total_user_trips = @trips_submitted_list + @trips_created_list
  end

end

# number_of_trips = @submission_list.size
