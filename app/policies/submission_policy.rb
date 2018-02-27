class SubmissionPolicy < ApplicationPolicy
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
    current_user?
  end

private

  def current_user?
    @record.user == @user
  end

end
