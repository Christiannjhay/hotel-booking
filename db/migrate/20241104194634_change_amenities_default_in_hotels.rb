class ChangeAmenitiesDefaultInHotels < ActiveRecord::Migration[7.2]
  def change
    change_column_default :hotels, :amenities, from: nil, to: []
  end
end
