class RenameArtistStatementsToArtworkStatement < ActiveRecord::Migration[5.2]
  def change
    rename_table :artist_statements, :artwork_statements
  end
end
