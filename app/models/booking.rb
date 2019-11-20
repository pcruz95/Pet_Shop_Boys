class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  has_one :review
end
