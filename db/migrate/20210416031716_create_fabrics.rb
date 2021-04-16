class CreateFabrics < ActiveRecord::Migration[5.2]
  def change
    create_table :fabrics do |t|
      t.string :name
      t.string :category
      t.references :clothing, foreign_key: true

      t.timestamps
    end
  end
end
