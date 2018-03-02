class SubmissionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end




  def create?
    (current_user_is_driver? || status_already_applied? || seat_full?) ? false : true
    # return false if current_user_is_driver? || status_already_accepted?
    # true
  end



  def destroy?
    current_user?
  end

  def status_pending?
    @record.trip.submissions.where(user_id: @user.id, accepted: nil).exists?
  end

  def status_rejected?
    @record.trip.submissions.where(user_id: @user.id, accepted: false).exists?
  end

  def status_accepted?
    @record.trip.submissions.where(user_id: @user.id, accepted: true).exists?
  end

  def seat_full?
    # Retourne false si le nombre de submission accepted pour ce trip est superieur ou egal au nombre de seat du trip
    @record.trip.submissions.where(accepted: true).to_a.size >= @record.trip.seats
  end

  def automatic?
    @record.trip.auto_accept
  end

  def status_already_applied?
    #si le current_user a deja soumis une candidature qui
    #a été acceptée par le driver retourner false
    @trip_id = @record.trip.id
    scope.all.where(trip_id: @trip_id, user_id: @user.id).exists?
  end
private

  def current_user?
    @record.user == @user
  end

  def current_user_is_driver?
    @record.trip.user == user
  end


end
