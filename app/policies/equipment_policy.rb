class EquipmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve

      # scope is teh equipment class itself
      # user is the current_user

      scope.all
      # scope.where(user: user) # you cannot see all equipments but only
      # the ones you created, if you want to see all use scope.all
    end
  end

  # no need for new? (calls create) and edit? because edit calls update

  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end
end
