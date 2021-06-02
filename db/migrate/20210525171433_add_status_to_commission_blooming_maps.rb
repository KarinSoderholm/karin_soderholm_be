class AddStatusToCommissionBloomingMaps < ActiveRecord::Migration[5.2]
  def up
    # execute <<-SQL
    #   CREATE TYPE commission_status AS ENUM ('not_started', 'unfinished', 'finished', 'delivered');
    # SQL
    add_column :commission_blooming_maps, :commission_status, :string, default: 'not_started'
  end

  def down
    remove_column :commission_blooming_maps, :status
    execute <<-SQL
      DROP TYPE status;
    SQL
  end
end
