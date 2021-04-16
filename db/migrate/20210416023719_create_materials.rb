class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :category
      t.references :artwork, foreign_key: true

      t.timestamps
    end
  end
end
