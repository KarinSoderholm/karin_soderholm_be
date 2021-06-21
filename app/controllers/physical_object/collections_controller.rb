class PhysicalObject::CollectionsController < ApplicationController
  def index
    @clothings = Clothing.all
    @collections = Collection.find_objects
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
