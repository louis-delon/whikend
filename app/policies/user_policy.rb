class UserPolicy < ApplicationPolicy

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    user_is_owner_or_admin? ? true : false
  end

  private

  def user_is_owner_or_admin?
    user.admin || @record == user
  end

end
