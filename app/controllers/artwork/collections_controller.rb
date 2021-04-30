class Artwork::CollectionsController < ApplicationController
  def index
    @artworks = Artwork.all
    @collections = @artworks.map do |artwork|
      artwork.collection
    end.uniq
  end

  def show
    binding.pry
    @collection = Artwork.find_by(collection: params[:collection_type])
  end

end
