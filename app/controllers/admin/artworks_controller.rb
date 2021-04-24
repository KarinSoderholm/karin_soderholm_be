# class ArtworksController < ApplicationController
class Admin::ArtworksController < Admin::BaseController
  before_action :set_artwork, only: [:show, :update, :destroy, :import]

  def import
    Artwork.import(params[:file])
    redirect_to admin_dashboard_index_path, notice: "Artwork Data Imported Successfully!"
  end
  # GET /artworks
  def index
    @artworks = Artwork.all
    # render json: @artworks
  end

  # GET /artworks/1
  def show
    # render json: @artwork
  end

  def new

  end
  # POST /artworks
  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      flash[:success] = 'You did it! You created a new art piece in the database!'
      redirect_to admin_artworks_path
      # render json: @artwork, status: :created, location: @artwork
    else
      flash.now[:error] = "Cannot leave manditory fields empty. Please try again"
      render :new
      # render json: @artwork.errors, status: :unprocessable_entity
    end
  end

  def edit
    @artwork = Artwork.find(params[:id])
  end
  # PATCH/PUT /artworks/1
  def update
    if @artwork.update(artwork_params)
      flash[:success] = 'You did it! You edited your artwork data!'
      redirect_to admin_artworks_path
      # render json: @artwork
    else
      flash.now[:error] = "Cannot leave manditory fields empty. Please try again"
      render :edit
      # render json: @artwork.errors, status: :unprocessable_entity
    end
  end

  def alert
    @artwork = Artwork.find(params[:artwork_id])
  end

  # DELETE /artworks/1
  def destroy
    if @artwork.destroy
      flash[:success] = 'The Workshop was successfully removed!'
      redirect_to admin_artworks_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artwork
      @artwork = Artwork.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def artwork_params
      if !params[:artwork].nil?
        params.require(:artwork).permit(:name, :description, :image, :materials, :create_date, :sell_date, :cost, :available, :art_shows, images: [])
      else
        hash = {}
        hash[:name] = params[:name]
        hash[:description] = params[:description]
        hash[:image] = params[:image]
        # hash[:images] = params[:images]
        hash[:create_date] = params[:create_date]
        hash[:sell_date] = params[:sell_date]
        hash[:cost] = params[:cost]
        hash[:available] = params[:available]
        return hash
      end
    end
end
