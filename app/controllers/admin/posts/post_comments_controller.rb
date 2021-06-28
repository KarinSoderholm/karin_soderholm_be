class Admin::Posts::PostCommentsController < Admin::BaseController
  before_action :set_comment, only: [:show, :update, :destroy, :edit]
  before_action :set_blog_post, only: [:show, :new, :update, :index, :destroy, :edit]

  def show
  end

  def index
    @comments = PostComment.all
  end

  def edit
    @comments = PostComment.all
  end

  def update
    if @comment.update(comment_params)
      flash[:success] = "You updated your PostComment! Congrats"
      redirect_to admin_tag_path(@comment)
    else
      flash.now[:error] = 'Cannot update the PostComment. Please fill out manditory fields and try again'
      render :edit
    end
  end

  # def new
  #   # @comments = PostComment.all
  # end

  # def create
  #   comment = PostComment.new(comment_params)
  #   blog_post = BlogPost.find(params[:blog_post_id])
  #   # total_comments = PostComment.distinct.pluck(:title)
  #
  #   if !PostComment.where(title: comment.title).any?
  #   # if !total_comments.include?(comment.title)
  #     comment.save
  #     blog_post.comment_posts.create({ comment_id: comment.id, blog_post_id: blog_post.id })
  #     flash[:success] = "You created a new PostComment! Congrats"
  #     redirect_to admin_blog_post_path(blog_post)
  #   elsif BlogPost.joins(:comments).where(id: blog_post.id).pluck("comments.title").include?(comment.title)
  #     flash[:message] = "You already commentged this Post with that comment."
  #     redirect_to admin_blog_post_path(blog_post)
  #   elsif PostComment.where(title: comment.title).any?
  #   # elsif total_comments.include(comment.title)
  #     already_comment = PostComment.find_by(title: comment.title)
  #     blog_post.comment_posts.create({ comment_id: already_comment.id, blog_post_id: blog_post.id })
  #     flash[:success] = "You created a new PostComment! Congrats"
  #     redirect_to admin_blog_post_path(blog_post)
  #   else
  #     flash.now[:error] = 'Cannot create the PostComment. Please fill out manditory fields and try again'
  #     render :new
  #   end
  # end

  def destroy
    if @comment.destroy
      flash[:success] = "The PostComment was successfully deleted!"
      redirect_to admin_blog_post_path(@blog_post)
    else
      flash[:error] = 'Something went wront with that request. Please try again'
      render :show
    end
  end

  private

  def set_comment
    @comment = PostComment.find(params[:id])
  end

  def set_blog_post
    @blog_post = BlogPost.find(params[:blog_post_id])
  end

  def comment_params
    if !params[:comment].nil?
      params.require(:comment).permit(:title)
    else
      hash = {}
      hash[:title] = params[:title]
      # hash[:blog_post_id] = params[:blog_post_id]
      return hash
    end
  end
end
