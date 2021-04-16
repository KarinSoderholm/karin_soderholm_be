class CreateArtistStatements < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_statements do |t|
      t.string :name
      t.text :statement
      t.references :artwork, foreign_key: true

      t.timestamps
    end
  end
end
