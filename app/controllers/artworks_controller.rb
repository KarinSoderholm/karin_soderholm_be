class ArtworksController < ApplicationController
  def index
# binding.pry
    @artworks = Artwork.all
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  def flash
    {}
  end
end
