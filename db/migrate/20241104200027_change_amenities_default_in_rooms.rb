class ChangeAmenitiesDefaultInRooms < ActiveRecord::Migration[7.2]
  def change
    change_column_default :rooms, :amenities, from: nil, to: []
  end
end
