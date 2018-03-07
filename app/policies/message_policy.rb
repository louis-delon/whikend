class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def destroy?
    user_is_admin? ? true : false
  end

  private

  def user_is_admin?
    user.admin
  end

  def current_user?
    @record.user == @user
  end

end
