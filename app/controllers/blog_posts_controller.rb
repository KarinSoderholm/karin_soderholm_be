class BlogPostsController < ApplicationController
  def show
    @blog_post = BlogPost.find(params[:id])
  end

  def index
    @blog_posts = BlogPost.all.order(created_at: :desc)
  end

  def blog_type
    @blog_posts = BlogPost.find_blogs_by_tag(params[:tag_id])
    @tag = Tag.find(params[:tag_id])
  end
end
