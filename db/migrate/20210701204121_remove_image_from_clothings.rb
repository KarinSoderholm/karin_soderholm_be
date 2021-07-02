class RemoveImageFromClothings < ActiveRecord::Migration[5.2]
  def change
    remove_column :clothings, :image, :string
  end
end
