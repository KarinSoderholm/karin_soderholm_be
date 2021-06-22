class Admin::User::ArtistStatementsController < Admin::BaseController
  before_action :set_artist_statement, only: [:show, :edit, :update, :destroy, :edit]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :new]

  def index
    @artist_statements = ArtistStatement.all
  end

  def show
    @artist_statement = ArtistStatement.find(params[:id])
  end

  def new
  end

  def create
    @artist_statement = ArtistStatement.new(artist_statement_params)

    if @artist_statement.save
      flash[:success] = "Hooray, you have saved a Statement to #{current_user.name}'s Profile"
      redirect_to "/admin/user/#{current_user.id}/artist_statement/#{@artist_statement.id}"
    else
      flash.now[:error] = "Please make sure the field is filled out. Please try again"
      render :new
    end
  end

  def edit
  end

  def update
    if @artist_statement.update(artist_statement_params)
      flash[:success] = "Hooray, you have updated your Artist Statement"
      redirect_to "/admin/user/#{@user.id}/artist_statement/#{@artist_statement.id}"
    else
      flash.now[:error] = "Please make sure the field is filled out. Please try again"
      render :edit
    end
  end

  def destroy
    # artist = Artist.find(artist_statement_params[:user_id])
    if @artist_statement.destroy
      flash[:success] = "Hooray, you have deleted your Artist Statement"
      redirect_to "/admin/users/#{current_user.id}"
    else
      flash.now[:error] = "The Artist Statement was not deleted. Please try again"
      render :show
    end
  end

  private
  def artist_statement_params
    if params[:artist_statement]
      params.require(:artist_statement).permit(:statement, :user_id)
    else
      hash = {}
      hash[:statement] = params[:statement]
      hash[:user_id] = params[:user_id]
      return hash
    end
  end

  def set_artist_statement
    @artist_statement = ArtistStatement.find(params[:id])
  end

  def set_user
    @user = current_user
  end
end
