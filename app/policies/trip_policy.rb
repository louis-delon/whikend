class TripPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    current_user?
  end

  def update?
    current_user?
  end

  def destroy?
    current_user?
  end

private

  def current_user?
    @record.user == @user
  end

end
