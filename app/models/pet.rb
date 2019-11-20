class Pet < ApplicationRecord
  validates :photo, presence: true
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  mount_uploader :photo, PhotoUploader

  def average_rating
    return 0 if reviews.count == 0
    reviews.sum(:rating) / reviews.count
  end
end
