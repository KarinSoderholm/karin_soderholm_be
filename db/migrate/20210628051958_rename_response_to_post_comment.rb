class RenameResponseToPostComment < ActiveRecord::Migration[5.2]
  def change
    rename_table :responses, :post_comments
  end
end
