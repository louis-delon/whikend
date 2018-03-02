class SubmissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    if current_user_is_driver? == true
      return false
    else
      return true
      # if has_been_accepted? == true
      #   return false
      # else
      #   return true
      # end
      # raise
    end
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

  def current_user_is_driver?
    @record.trip.user == user
  end

  def has_been_accepted?
    #si le current_user a deja soumis une candidature qui
    #a été acceptée par le driver retourner false
    # raise
    if @record.accepted != true
      raise
      return true
    else
      return false
    end
  end

end
