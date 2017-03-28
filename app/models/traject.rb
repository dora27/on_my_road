class Traject < ApplicationRecord
  belongs_to :user
  has_many :stops, dependent: :destroy

  geocoded_by :starting_address
  after_validation :geocode, if: :starting_address_changed?

  validates :starting_address, presence: true
end
