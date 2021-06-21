class Admin::ArtworkStatementsController < Admin::BaseController
  before_action :set_artwork_statement, only: [:show, :edit, :update, :destroy]
  def index
    @artwork_statements = ArtworkStatement.all
  end

  def show
  end

  def create
    @artwork_statement = ArtworkStatement.new(artwork_statement_params)
    artwork = Artwork.find(artwork_statement_params[:artwork_id])
    if @artwork_statement.save
      flash[:success] = "Hooray, you have saved a Statement to #{artwork}"
    else
      flash.now[:error] = "Please make sure the field is filled out. Please try again"
      render :new
    end
  end

  def edit

  end

  def update
    if @artwork_statement.update(artwork_statement_params)
      flash[:success] = "Hooray, you have updated your Artwork Statement"
    else
      flash.now[:error] = "Please make sure the field is filled out. Please try again"
      render :edit
    end
  end

  def destroy
    if @artwork_statement.destroy
      flash[:success] = "Hooray, you have deleted your Artwork Statement"
    else
      flash.now[:error] = "The Artwork Statement was not deleted. Please try again"
      render :show
    end
  end

  private
    def set_artwork_statement
      @artwork_statement = ArtworkStatement.find(params[:id])
    end

    def artwork_statement_params
      if params[:artwork]
        params.require(:artwork_statement).permit(:statement, :artwork_id)
      else
        hash = {}
        hash[:description] = params[:description]
        hash[:artwork_id] = params[:artwork_id]
        return hash
      end
    end
end
