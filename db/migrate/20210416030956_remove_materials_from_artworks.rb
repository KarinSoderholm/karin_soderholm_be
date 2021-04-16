class RemoveMaterialsFromArtworks < ActiveRecord::Migration[5.2]
  def change
    remove_column :artworks, :materials, :string
  end
end
