class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :materials
      t.date :create_date
      t.date :sell_date
      t.float :cost
      t.string :art_shows
      t.boolean :available

      t.timestamps
    end
  end
end
