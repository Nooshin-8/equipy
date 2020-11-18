class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def show?
    # return true
  # end

  def create?
    return true
  end

  def update?
    user == record.equipment.user
  end

  def destroy?
    user == record.user
  end
end
