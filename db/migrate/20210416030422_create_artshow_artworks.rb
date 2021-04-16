class CreateArtshowArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artshow_artworks do |t|
      t.references :artshow, foreign_key: true
      t.references :artwork, foreign_key: true

      t.timestamps
    end
  end
end
