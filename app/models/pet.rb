class Pet < ApplicationRecord
  validates :photo, presence: true
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader

  def average_rating
    return 0 if reviews.count == 0
    reviews.sum(:rating) / reviews.count
  end

  include PgSearch::Model
  pg_search_scope :search_by_address_and_type,
    against: [ :address, :animal_type ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
