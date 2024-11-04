class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :hotel, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.string :customer_name
      t.datetime :check_in_date
      t.datetime :check_out_date
      t.integer :number_of_guests
      t.decimal :total_price

      t.timestamps
    end
  end
end
