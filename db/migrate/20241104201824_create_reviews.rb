class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.references :hotel, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
