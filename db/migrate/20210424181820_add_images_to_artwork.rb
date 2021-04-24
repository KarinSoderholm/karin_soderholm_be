class AddImagesToArtwork < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :images, :text, array: true, default: [], null: true
  end
end
