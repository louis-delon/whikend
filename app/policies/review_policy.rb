class ReviewPolicy < ApplicationPolicy
  # def create?
  #   @record.trip.users.include?(user) || @record.trip.user == user
  # end

  def create?
    user_participated_to_trip? ? true : false
  end

  def edit?
    update?
  end

  def update?
    user_is_admin? ? true : false
  end

  def destroy?
    user_is_admin? ? true : false
  end

  private

  def user_is_admin?
    user.admin
  end

  def user_participated_to_trip?
    @sender_id = current_user || @receiver_id = @trip.user
  end

end
