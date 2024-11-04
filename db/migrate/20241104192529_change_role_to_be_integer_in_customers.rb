class ChangeRoleToBeIntegerInCustomers < ActiveRecord::Migration[7.2]
  def change
    remove_column :customers, :role, :string
    add_column :customers, :role, :integer, default: 0
  end
end
