class Request < ApplicationRecord
  geocoded_by :request_address
  after_validation :geocode, if: :request_address_changed?

  validates :request_address, presence: true
end
