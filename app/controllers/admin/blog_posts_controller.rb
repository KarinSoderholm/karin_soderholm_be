class Admin::BlogPostsController < Admin::BaseController
  before_action :set_blog_post, only: [:show, :update, :destroy, :edit]

  def show
  end

  def index
    @blog_posts = BlogPost.all
  end

  def edit
    @blog_posts = BlogPost.all
  end

  def update
    if @blog_post.update(blog_post_params)
      if !TagPost.exists?(blog_post_id: @blog_post.id, tag_id: params[:blog_post][:tags])
        TagPost.create({blog_post_id: @blog_post.id, tag_id: params[:blog_post][:tags]})
      end
      flash[:success] = "You updated your BlogPost! Congrats"
      redirect_to admin_blog_post_path(@blog_post)
    else
      flash.now[:error] = 'Cannot update the BlogPost. Please fill out manditory fields and try again'
      render :edit
    end
  end

  def new
    # @blog_posts = BlogPost.all
  end

  def create
    blog_post = BlogPost.new(blog_post_params)
    if blog_post.save
      total_tags = Tag.distinct.pluck(:title)
      if !total_tags.include?(params[:tag])
        blog_post.tags.create({title: params[:tag]})
        blog_post.set_image(params)
        flash[:success] = "You created a new BlogPost! Congrats"
        redirect_to admin_blog_posts_path
      else
        already_tag = Tag.find_by(title: params[:tag])
        TagPost.create({blog_post_id: blog_post.id, tag_id: already_tag.id})
        flash[:success] = "You created a new BlogPost! Congrats"
        redirect_to admin_blog_posts_path
      end
    else
      flash.now[:error] = 'Cannot create the BlogPost. Please fill out manditory fields and try again'
      render :new
    end
  end

  def destroy
    @blog_post.remove_image(params)
    if @blog_post.destroy
      flash[:success] = "The BlogPost was successfully deleted!"
      redirect_to admin_blog_posts_path
    else
      flash[:error] = 'Something went wront with that request. Please try again'
      render :show
    end
  end

  def add_photos
    @blog_post = BlogPost.find(params[:blog_post_id])
  end

  def photo_update
    @blog_post = BlogPost.find(post_photos_params[:blog_post_id])
    if post_photos_params[:photo]
      @blog_post.photos.attach(post_photos_params[:photo])
      flash[:success] = "A photo was successfully added to #{@blog_post.title}"
      redirect_to admin_blog_post_path(@blog_post)
    else
      flash.now[:error] = 'Please try again. Unable to process that request'
      render :add_photos
    end
  end

  def remove_photo
    blog_post = BlogPost.find(params[:blog_post_id])
    if blog_post
      blog_post.photos.find(params[:photo_id]).purge
      flash[:success] = "A photo was successfully deleted from #{blog_post.title}"
      redirect_to admin_blog_post_path(blog_post)
    else
      flash.now[:error] = 'Please try again. Unable to process that request'
      render :show
    end
  end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  end

  def post_photos_params
    hash = {}
    hash[:blog_post_id] = params[:blog_post_id].to_i
    hash[:photo] = params[:blog_post][:photos]
    return hash
  end

  def blog_post_params
    if !params[:blog_post].nil?
      params.require(:blog_post).permit(:title, :body, :author, :user_id, :photos)
    else
      hash = {}
      hash[:title] = params[:title]
      hash[:body] = params[:body]
      hash[:author] = params[:author]
      hash[:user_id] = params[:user_id]
      return hash
    end
  end
end
