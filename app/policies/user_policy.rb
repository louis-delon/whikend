class UserPolicy < ApplicationPolicy

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    user_is_owner? ? true : false
  end

  private

  def user_is_owner?
    @record == user
  end

end
