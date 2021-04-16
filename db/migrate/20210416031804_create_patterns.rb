class CreatePatterns < ActiveRecord::Migration[5.2]
  def change
    create_table :patterns do |t|
      t.string :name
      t.string :designer
      t.references :clothing, foreign_key: true

      t.timestamps
    end
  end
end
