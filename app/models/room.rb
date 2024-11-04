class Room < ApplicationRecord
  belongs_to :hotel
  has_many :reviews
  
  validates :room_type, presence: true
  validates :max_persons, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
