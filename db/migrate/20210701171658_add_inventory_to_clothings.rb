class AddInventoryToClothings < ActiveRecord::Migration[5.2]
  def change
    add_column :clothings, :inventory, :integer, default: 1
  end
end
