class ContactPolicy < ApplicationPolicy

  def new?
    create?
    # authorize @contact
  end

  def create?
    true
  end


end
