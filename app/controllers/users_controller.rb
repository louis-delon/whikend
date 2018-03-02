class UsersController < ApplicationController

before_action :set_user, only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update

  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize(@user)
  end

end
