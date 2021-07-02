class Admin::User::ArtistStoriesController < Admin::BaseController
  before_action :set_artist_story, only: [:show, :edit, :update, :destroy, :edit]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :new]

  def index
    @artist_stories = ArtistStory.all
  end

  def show
    @artist_story = ArtistStory.find(params[:id])
  end

  def new
  end

  def create
    @artist_story = ArtistStory.new(artist_story_params)

    if @artist_story.save
      flash[:success] = "Hooray, you have saved a Story to #{current_user.name}'s Profile"
      redirect_to "/admin/user/#{current_user.id}/artist_stories/#{@artist_story.id}"
    else
      flash.now[:error] = "Please make sure the field is filled out. Please try again"
      render :new
    end
  end

  def edit
  end

  def update
    if @artist_story.update(artist_story_params)
      flash[:success] = "Hooray, you have updated your Artist Story"
      redirect_to "/admin/user/#{@user.id}/artist_stories/#{@artist_story.id}"
    else
      flash.now[:error] = "Please make sure the field is filled out. Please try again"
      render :edit
    end
  end

  def destroy
    if @artist_story.destroy
      flash[:success] = "Hooray, you have deleted your Artist Story"
      redirect_to "/admin/users/#{current_user.id}"
    else
      flash.now[:error] = "The Artist Story was not deleted. Please try again"
      render :show
    end
  end

  private
  def artist_story_params
    if params[:artist_story]
      params.require(:artist_story).permit(:story, :user_id)
    else
      hash = {}
      hash[:story] = params[:story]
      hash[:user_id] = params[:user_id]
      return hash
    end
  end

  def set_artist_story
    @artist_story = ArtistStory.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end
