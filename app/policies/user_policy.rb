class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record == user || record_booked_users_pet.include?(record.id)
  end

  def update?
    record == user
  end

  private

  def record_booked_users_pet
    pet_bookings = []
    user.pets.each { |pet| pet_bookings << pet.bookings }
    pet_bookings.flatten.map { |booking| booking.user_id }
  end
end
