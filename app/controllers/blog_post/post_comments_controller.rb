class BlogPost::PostCommentsController < ApplicationController
  def new
  end

  def create
    if Email.find_all_emails.include?(params[:guest_email])
      email = Email.find_by(email_address: params[:guest_email])
    else
      email = Email.create(name: params[:guest_name],
                            email_address: params[:guest_email])
    end
    if !current_user
      binding.pry
      guest_user = GuestUser.new
    end

    if email
      comment = PostComment.new(comment_params)
      blog_post = BlogPost.find(params[:blog_post_id])
      binding.pry
      if comment.save
        flash.now[:success] = "you commented"
        if params[:route_back_to] == 'monthly'
          array = blog_post.find_month_year
          redirect_to monthly_blogs_path(array[0], array[1])
        elsif params[:route_back_to] == 'blog_type'
          redirect_to blog_type_path(blog_post, comment.blog_post_id)
        else
          redirect_to blog_posts_path
        end
      else
        flash.now[:error] = "you must not leave any fields blank"
        redirect_to '/blog_posts'
      end
    else
      flash.now[:error] = "you must enter a valid  email address"
      redirect_to '/blog_posts'
    end
  end

  private
  def comment_params
    if params[:post_comment]
      params.require(:post_comment).permit(:comment, :guest_name, :guest_email, :blog_post_id)
    else
      hash = {}
      hash[:comment] = params[:comment]
      hash[:guest_name] = params[:guest_name]
      hash[:guest_email] = params[:guest_email]
      hash[:blog_post_id] = params[:blog_post_id]
      return hash
    end
  end
end
