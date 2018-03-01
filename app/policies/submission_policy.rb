class SubmissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end




  def create?
    # (current_user_is_driver? || status_already_accepted?) ? false : true
    return false if current_user_is_driver? || status_already_accepted?
    true

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

  def status_already_accepted?
    #si le current_user a deja soumis une candidature qui
    #a été acceptée par le driver retourner false
    @trip_id = @record.trip.id
    scope.all.where(trip_id: @trip_id, user_id: @user.id, accepted: true).exists?
  end

end
