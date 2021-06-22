class RemoveNameFromArtworkStatement < ActiveRecord::Migration[5.2]
  def change
    remove_column :artwork_statements, :name, :string
  end
end
