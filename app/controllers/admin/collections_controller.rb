class Admin::CollectionsController < Admin::BaseController
  before_action :set_collection, only: [:show, :update, :destroy]
  def show
  end

  def index
    @collections = Collection.all
  end

  def update
  end

  def new
  end

  def create
    @collection = Collection.new(collection_params)

    if !@collection.nil?
      @collection.save
      flash[:success] = "You created a new collection"
      redirect_to admin_collections_path
    else
      flash[:error] = "Unable to create a new collection. Please try again"
      render :new
    end
  end

  def alert
    @collection = Collection.find(params[:collection_id])
  end

  def destroy
    @collection.destroy
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
