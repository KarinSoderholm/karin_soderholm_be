# class ArtworksController < ApplicationController
class Admin::ArtworksController < Admin::BaseController
  before_action :set_artwork, only: [:show, :update, :destroy, :import]

  def import
    Artwork.import(params[:file])
    redirect_to root_url, notice: "Artwork Data Imported Successfully!"
  end
  # GET /artworks
  def index
    @artworks = Artwork.all
    render json: @artworks
  end

  # GET /artworks/1
  def show
    render json: @artwork
  end

  # POST /artworks
  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      render json: @artwork, status: :created, location: @artwork
    else
      # flash.alert = "Cannot leave manditory fields empty. Please try again"
      render json: @artwork.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artworks/1
  def update
    if @artwork.update(artwork_params)
      render json: @artwork
    else
      render json: @artwork.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artworks/1
  def destroy
    @artwork.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artwork
      @artwork = Artwork.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def artwork_params
      params.require(:artwork).permit(:name, :description, :image, :materials, :create_date, :sell_date, :cost, :available, :art_shows)
    end
end
