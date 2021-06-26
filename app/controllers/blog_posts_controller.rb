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

  def monthly_blogs
    posts = BlogPost.format_monthly_blog
    @blog_posts = []
    posts.map do |blog_id, date_array|
      if date_array[0] == params[:month_id] && date_array[1] == params[:year_id]
        @blog_posts << BlogPost.find(blog_id)
      end
    end
    @monthly_blog_title = @blog_posts.first.created_at.strftime("%B %Y")
  end
end
