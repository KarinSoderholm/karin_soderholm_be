class RemoveCollectionFromArtwork < ActiveRecord::Migration[5.2]
  def change
    remove_column :artworks, :collection, :string
  end
end
