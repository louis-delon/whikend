class SubmissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    !current_user?

    # raise
    # TO DO:
    # if number of acccepted submitters >= number of seats return false
    # scope.where(trip_id: "params[:id]", accepted: true).size < 3
    # if date of hike > today return false
  end

  def destroy?
    current_user?
  end

private

  def current_user?
    @record.user == @user
  end

end
