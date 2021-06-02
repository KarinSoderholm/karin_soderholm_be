class AddIndexToCommissionBloomingMaps < ActiveRecord::Migration[5.2]
  def change
    add_index :commission_blooming_maps, :commission_payment
  end
end
