class RenamePostsToBlogPosts < ActiveRecord::Migration[5.2]
  def change
    rename_table :posts, :blog_posts
  end
end
