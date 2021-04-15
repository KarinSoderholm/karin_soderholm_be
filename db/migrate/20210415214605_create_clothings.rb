class CreateClothings < ActiveRecord::Migration[5.2]
  def change
    create_table :clothings do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :fabric
      t.string :url
      t.string :category
      t.boolean :available
      t.string :pattern_name
      t.date :origin_date
      t.float :pattern_cost
      t.float :cost

      t.timestamps
    end
  end
end
