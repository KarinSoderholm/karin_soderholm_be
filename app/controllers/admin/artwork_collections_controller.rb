class Admin::ArtworkCollectionsController < Admin::BaseController
  before_action :set_artshow_collection, only: [:show, :update, :destroy]
  def show
  end

  def index
    @artwork_collections = ArtworkCollection.all
  end

  def update
  end

  def new
  end

  def create

  end
  private

  def set_artshow_collection
    @artwork_collection = ArtworkCollection.find(params[:id])
  end

  def artwork_collection_params
    if !params[:artwork_collection].nil?
      params.require(:artwork_collection).permit(:artwork_id, :collection_id)
    else
      hash = {}
      hash[:artwork_id] = params[:artwork_id]
      hash[:collection_id] = params[:collection_id]
    end
  end
end
