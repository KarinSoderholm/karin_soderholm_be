class RemoveArtShowsFromArtworks < ActiveRecord::Migration[5.2]
  def change
    remove_column :artworks, :art_shows, :string
  end
end
