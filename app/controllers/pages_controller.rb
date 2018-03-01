class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      @trips = Trip.global_search(params[:query])
    else
      @trips = Trip.all
    end
  end
end
