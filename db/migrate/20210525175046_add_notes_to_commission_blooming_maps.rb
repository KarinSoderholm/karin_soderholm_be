class AddNotesToCommissionBloomingMaps < ActiveRecord::Migration[5.2]
  def change
    add_column :commission_blooming_maps, :notes, :string
  end
end
