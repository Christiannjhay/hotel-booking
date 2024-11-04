class CreateCustomers < ActiveRecord::Migration[7.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile
      t.string :string
      t.string :password_1
      t.string :password_2

      t.timestamps
    end
  end
end