class ArtshowArtworksController < ApplicationController
  before_action :set_artshow_artwork, only: [:show, :update, :destroy]

  # GET /artshow_artworks
  def index
    @artshow_artworks = ArtshowArtwork.all

    render json: @artshow_artworks
  end

  # GET /artshow_artworks/1
  def show
    render json: @artshow_artwork
  end

  # POST /artshow_artworks
  def create
    @artshow_artwork = ArtshowArtwork.new(artshow_artwork_params)

    if @artshow_artwork.save
      render json: @artshow_artwork, status: :created, location: @artshow_artwork
    else
      render json: @artshow_artwork.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artshow_artworks/1
  def update
    if @artshow_artwork.update(artshow_artwork_params)
      render json: @artshow_artwork
    else
      render json: @artshow_artwork.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artshow_artworks/1
  def destroy
    @artshow_artwork.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artshow_artwork
      @artshow_artwork = ArtshowArtwork.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def artshow_artwork_params
      params.require(:artshow_artwork).permit(:artshow_id, :artwork_id)
    end
end
