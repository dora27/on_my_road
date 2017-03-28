class Review < ApplicationRecord
  belongs_to :traject
  validates :content
end
