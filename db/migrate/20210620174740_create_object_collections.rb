class CreateObjectCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :object_collections do |t|
      t.references :clothing, foreign_key: true
      t.references :collection, foreign_key: true

      t.timestamps
    end
  end
end
