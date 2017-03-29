class Review < ApplicationRecord
  belongs_to :traject
  belongs_to :user
  validates :content, length: { minimum: 10 }
end
