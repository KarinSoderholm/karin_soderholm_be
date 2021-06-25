class RenameTagPostPostToBlogPost < ActiveRecord::Migration[5.2]
  def change
    rename_column :tag_posts, :post_id, :blog_post_id
  end
end
