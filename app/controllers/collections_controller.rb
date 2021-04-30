class CollectionsController < ApplicationController
  def index
    @artworks = Artwork.all
    @collections = Collection.all
    # @collections = @artworks.map do |artwork|
    #   artwork.collection
    # end.uniq
  end

  def show
    binding.pry
    @collection = Collection.find(params[:id])
    @collection = Artwork.find_by(collection: params[:collection_type])
  end

end
