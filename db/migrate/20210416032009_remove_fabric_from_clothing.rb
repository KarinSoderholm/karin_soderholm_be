class RemoveFabricFromClothing < ActiveRecord::Migration[5.2]
  def change
    remove_column :clothings, :fabric, :string
    remove_column :clothings, :pattern_name, :string
    remove_column :clothings, :pattern_cost, :float
  end
end
