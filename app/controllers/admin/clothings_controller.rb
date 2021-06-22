class Admin::ClothingsController < Admin::BaseController
  before_action :set_clothing, only: [:show, :edit, :update, :destroy]

  def import
    Clothing.import(params[:file])
    redirect_to root_url, notice: "Clothing Data Imported Successfully!"
  end

  def index
    @clothings = Clothing.all
    if @clothings.nil?
      flash[:message] = "There are no objects in your collection! Please add some!"
      redirect_to admin_dashboard_index
    end
  end

  def show
    set_clothing
    if @clothing.nil?
      flash[:message] = "That object is no longer available."
      redirect_to admin_clothings_path
    end
  end

  def new
    @clothings = Clothing.all
    @collections = Collection.find_objects
  end

  def create
    @clothing = Clothing.new(clothing_params)
    collection = Collection.find(params[:collection])
    @clothing.set_images(params)
    if @clothing.save
      if !collection.nil?
        object_collection = ObjectCollection.new(clothing_id: @clothing.id, collection_id: collection.id)
      end
      if !@clothing.collections.include?(collection) && !collection.nil?
        object_collection.save({clothing_id: @clothing.id, collection_id: collection.id})
        flash[:success] = "Hooray! You have successfully added an Object to the Collection!"
        redirect_to admin_clothings_path
      end
    else
      flash.now[:alert] = "Please check to make sure the fields are all filled in properly. Try again"
      render :new
    end
  end

  def edit
    @clothings = Clothing.all
    @collections = Collection.find_objects
  end

  def update
    @clothings = Clothing.all
    @clothing.set_availability(params)
    @clothing.set_images(params)
    collection = Collection.find(params[:collection])

    if @clothing.update(clothing_params) && @clothing.object_collections.first.update({name: collection.name, collection_type: collection.collection_type})
      flash[:success] = "Hooray! You have successfully updated your Object!"
      redirect_to admin_clothings_path
    else
      flash.now[:alert] = "Please check to make sure the fields are all filled in properly. Try again"
      render :edit
    end
  end

  def alert
    @clothing = Clothing.find(params[:clothing_id])
  end

  def destroy
    if @clothing.destroy
      flash[:notice] = "You have successfully destroyed your Object from the Collection"
      redirect_to admin_clothings_path
    else
      flash.now[:error] = "Something went wrong. The object was not deleted. Try again"
      render :show
    end
  end

  def add_photos
    @clothing = Clothing.find(params[:clothing_id])
  end

  def photo_update
    @clothing = Clothing.find(clothing_photos_params[:clothing_id])
    if clothing_photos_params[:photo]
      @clothing.photos.attach(clothing_photos_params[:photo])
      flash[:success] = "A photo was successfully added to #{@clothing.name}"
      redirect_to admin_clothing_path(@clothing)
    else
      flash.now[:error] = 'Please try again. Unable to process that request'
      render :add_photos
    end
  end

  def remove_photo
    clothing = Clothing.find(params[:clothing_id])
    if clothing
      clothing.photos.find(params[:photo_id]).purge
      flash[:success] = "A photo was successfully deleted from #{clothing.name}"
      redirect_to admin_clothing_path(clothing)
    else
      flash.now[:error] = 'Please try again. Unable to process that request'
      render :show
    end
  end

  private
    def set_clothing
      @clothing = Clothing.find(params[:id])
    end

    def clothing_photos_params
      hash = {}
      hash[:clothing_id] = params[:clothing_id].to_i
      hash[:photo] = params[:clothing][:photos]
      return hash
    end

    def clothing_params
      if !params[:clothing].nil?
        params.require(:clothing).permit(:name, :description, :fabric, :url, :category, :available, :pattern_name, :origin_date, :pattern_cost, :cost, :image, photos: [])
      else
        hash = {}
        hash[:name] = params[:name]
        hash[:description] = params[:description]
        hash[:category] = params[:category]
        hash[:available] = params[:available]
        hash[:origin_date] = params[:origin_date]
        hash[:cost] = params[:cost]
        return hash
      end
    end
end
