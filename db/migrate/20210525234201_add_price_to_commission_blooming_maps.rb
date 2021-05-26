class AddPriceToCommissionBloomingMaps < ActiveRecord::Migration[5.2]
  def change
    add_column :commission_blooming_maps, :price, :float
  end
end
