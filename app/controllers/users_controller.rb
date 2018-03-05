class UsersController < ApplicationController

before_action :set_user, only: [:show, :edit, :update]

  def show
    @average = calcul_average_rating(@user)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize(@user)
  end


  private

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
end
