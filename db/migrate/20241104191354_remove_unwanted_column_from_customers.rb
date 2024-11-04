class RemoveUnwantedColumnFromCustomers < ActiveRecord::Migration[7.2]
  def change
    remove_column :customers, :string, :string
  end
end
