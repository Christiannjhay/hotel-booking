class AddRoleToCustomers < ActiveRecord::Migration[7.2]
  def change
    add_column :customers, :role, :integer, default: 0
  end
end
