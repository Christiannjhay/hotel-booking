class CreateHotels < ActiveRecord::Migration[7.2]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :location
      t.string :contact
      t.string :description
      t.json :amenities

      t.timestamps
    end
  end
end
