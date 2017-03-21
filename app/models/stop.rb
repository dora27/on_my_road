class Stop < ApplicationRecord
  belongs_to :traject
  belongs_to :user

  geocoded_by :stop_address
  after_validation :geocode, if: :stop_address_changed?

  validates :stop_address, presence: true
end
