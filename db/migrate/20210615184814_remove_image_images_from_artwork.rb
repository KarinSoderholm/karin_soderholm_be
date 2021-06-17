class RemoveImageImagesFromArtwork < ActiveRecord::Migration[5.2]
  def change
    remove_column :artworks, :image, :string
    remove_column :artworks, :images, :text
  end
end
