class BlogPost::PostCommentsController < ApplicationController
  def new
  end

  def create
    binding.pry
    email = Email.create(name: params[:guest_name],
                          email_address: params[:guest_email]
    )
    if email
      comment = PostComment.new(comment_params)
      if comment.save
        flash.now[:success] = "you commented"
        redirect_to blog_posts_path
      else
        flash.now[:error] = "you must not leave any fields blank"
        redirect_to'/blog_posts'
      end
    else
      flash.now[:error] = "you must enter a valid  email address"
      render blog_posts_path
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