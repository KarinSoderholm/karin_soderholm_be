class RenamePostCommentsResponseToComment < ActiveRecord::Migration[5.2]
  def change
    rename_column :post_comments, :response, :comment
  end
end
