class CreateRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :rooms do |t|
      t.references :hotel, null: false, foreign_key: true
      t.string :room_type
      t.integer :max_persons
      t.text :description
      t.decimal :price
      t.json :amenities
      t.integer :quantity

      t.timestamps
    end
  end
end
