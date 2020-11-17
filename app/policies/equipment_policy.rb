class EquipmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve

      # scope is teh equipment class itself
      # user is the current_user

      scope.all
    end
  end

  # def new?
    # return true
  # end

  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    return user == record.user
  end

  def destroy?
    return user == record.user
  end

end
