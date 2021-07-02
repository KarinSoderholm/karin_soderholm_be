class AddInventoryToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :inventory, :integer, default: 1
  end
end
