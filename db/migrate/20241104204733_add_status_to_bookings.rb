class AddStatusToBookings < ActiveRecord::Migration[7.2]
  def change
    add_column :bookings, :status, :integer, default: 0
  end
end
