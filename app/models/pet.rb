class Pet < ApplicationRecord
  validates :photo, presence: true
  belongs_to :user
  has_many :bookings, dependent: :destroy

  mount_uploader :photo, PhotoUploader
end
