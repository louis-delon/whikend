module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User 
  end


  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def average(user)
    if !user.reviews.empty?
      @rating = []
      user.reviews.each { |review| @rating << review.rating }
      @rating.inject(&:+) / @rating.size
    else
      0
    end
  end
end
