class AddCommissionStatusToCommissionBloomingMaps < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL
      CREATE TYPE commission_status AS ENUM ('not_started', 'started', 'finished', 'delivered');
    SQL
    add_column :commission_blooming_maps, :commission_status, :string, default: :not_started
  end
end
