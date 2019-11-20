module ApplicationHelper
  # for bookings
  def calcule_price(pet_price, start_date, end_date)
    pet_price * ((end_date - start_date).to_i + 1)
  end
end
