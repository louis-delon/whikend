class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @trips = policy_scope(Trip).where('trips.date > ?', Date.today)
    @trips = @trips.where(date: params[:date]) if params[:date].present?
    @trips = @trips.global_search(params[:query]) if params[:query].present?
  end

  def page_title
      "Whikend Home"
  end

end
