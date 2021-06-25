class Admin::Posts::TagsController < Admin::BaseController
  before_action :set_tag, only: [:show, :update, :destroy, :edit]
  before_action :set_blog_post, only: [:show, :new, :update, :index, :destroy, :edit]

  def show
  end

  def index
    @tags = Tag.all
  end

  def edit
    @tags = Tag.all
  end

  def update
    if @tag.update(tag_params)
      flash[:success] = "You updated your Tag! Congrats"
      redirect_to admin_tag_path(@tag)
    else
      flash.now[:error] = 'Cannot update the Tag. Please fill out manditory fields and try again'
      render :edit
    end
  end

  def new
    # @tags = Tag.all
  end

  def create
    tag = Tag.new(tag_params)
    blog_post = BlogPost.find(params[:blog_post_id])
    if tag.save
      blog_post.tag_posts.create({ tag_id: tag.id, blog_post_id: blog_post.id })
      # TagPost.create({ tag_id: tag.id, blog_post_id: blog_post.id })
      flash[:success] = "You created a new Tag! Congrats"
      redirect_to admin_blog_post_path(blog_post)
    else
      flash.now[:error] = 'Cannot create the Tag. Please fill out manditory fields and try again'
      render :new
    end
  end

  def destroy
    if @tag.destroy
      flash[:success] = "The Tag was successfully deleted!"
      redirect_to admin_blog_post_path(@blog_post)
    else
      flash[:error] = 'Something went wront with that request. Please try again'
      render :show
    end
  end

  private

  def set_tag
    binding.pry
    @tag = Tag.find(params[:id])
  end

  def set_blog_post
    @blog_post = BlogPost.find(params[:blog_post_id])
  end

  def tag_params
    if !params[:tag].nil?
      params.require(:tag).permit(:title)
    else
      hash = {}
      hash[:title] = params[:title]
      # hash[:blog_post_id] = params[:blog_post_id]
      return hash
    end
  end
end
