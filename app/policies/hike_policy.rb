class HikePolicy < ApplicationPolicy
  def hikes_by_department?
    true
  end
end
