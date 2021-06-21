class AddCollectionTypeToCollections < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL
      CREATE TYPE collection_type AS ENUM ('art', 'object');
    SQL
    add_column :collections, :collection_type, :string
    add_index :collections, :collection_type
  end
end
