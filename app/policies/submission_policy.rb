class SubmissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
    # raise
    # scope.where(trip_id: "params[:id]", accepted: true).size < 3
  end

  def destroy?
    current_user?
  end

private

  def current_user?
    @record.user == @user
  end

end
