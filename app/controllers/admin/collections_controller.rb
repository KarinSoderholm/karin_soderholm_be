class Admin::CollectionsController < Admin::BaseController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  def show
  end

  def index
    @collections = Collection.all
  end

  def edit
  end

  def update
    if @collection.update(collection_params)
      flash[:message] = "The Collection was successfully updated!"
      redirect_to admin_collections_path
    else
      flash.now[:message] = "Something went wrong. That request can't be handled at this time."
      render :edit
    end
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
      params.require(:collection).permit(:name, :collection_type)
    else
      hash = {}
      hash[:name] = params[:name]
      hash[:collection_type] = params[:collection_type]
      return hash
    end
  end
end
