class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user_is_booker_or_pet_owner
  end

  def create?
    true
  end

  def destroy?
    user_is_booker_or_pet_owner
  end

  private

  def user_is_booker_or_pet_owner
    record.user == user || record.pet.user == user
  end
end
