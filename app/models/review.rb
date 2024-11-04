class Review < ApplicationRecord
  belongs_to :hotel
  belongs_to :room
  belongs_to :customer

  validates :name, presence: true
  validates :description, presence: true
end
