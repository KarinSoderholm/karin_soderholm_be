class CollectionsController < ApplicationController
  def index
    @artworks = Artwork.all
    @collections = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def new

  end

  def create

  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    if !params[:collection].nil?
      params.require(:collection).permit(:name)
    else
      hash = {}
      hash[:name] = params[:name]
      return hash
    end
  end
end
