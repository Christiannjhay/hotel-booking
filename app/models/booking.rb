class Booking < ApplicationRecord
  enum status: { active: 0, cancelled: 1, completed: 2}

  belongs_to :customer
  belongs_to :hotel
  belongs_to :room

  validate :check_for_double_booking

  private

  def check_for_double_booking
    overlapping_bookings = Booking.where(room_id: room_id)
                                   .where(status: :active)
                                   .where.not(id: id) # Exclude current booking if updating
                                   .where("check_in_date < ? AND check_out_date > ?", check_out_date, check_in_date)

    if overlapping_bookings.exists?
      errors.add(:base, "This room is already booked for the selected dates.")
    end
  end
end
