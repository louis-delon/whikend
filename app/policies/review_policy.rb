class ReviewPolicy < ApplicationPolicy
  # def create?
  #   @record.trip.users.include?(user) || @record.trip.user == user
  # end
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

end
