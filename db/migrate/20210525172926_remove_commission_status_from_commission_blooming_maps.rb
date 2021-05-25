class RemoveCommissionStatusFromCommissionBloomingMaps < ActiveRecord::Migration[5.2]
  def change
    remove_column :commission_blooming_maps, :commission_status, :string
  end
end
