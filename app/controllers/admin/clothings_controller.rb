class Admin::ClothingsController < Admin::BaseController
  before_action :set_clothing, only: [:show, :update, :destroy]

  def import
    Clothing.import(params[:file])
    redirect_to root_url, notice: "Clothing Data Imported Successfully!"
  end

  def index
    @clothings = Clothing.all
    if @clothings.nil?
      flash[:message] = "There are no garments in your collection! Please add some!"
      redirect_to admin_dashboard_index
    end
  end

  def show
    set_clothing
    if @clothing.nil?
      flash[:message] = "That garment is no longer available."
      redirect_to admin_clothings_path
    end
  end


  def create
    @clothing = Clothing.new(clothing_params)

    if @clothing.save
      flash[:success] = "Hooray! You have successfully added a Garment to the Collection!"
      redirect_to admin_clothings_path
    else
      flash.now[:alert] = "Please check to make sure the fields are all filled in properly. Try again"
      render :new
    end
  end

  def edit
    @clothings = Clothing.all
    @clothing = Clothing.find(params[:id])

  end

  def update
    @clothings = Clothing.all
    if @clothing.update(clothing_params)
      flash[:success] = "Hooray! You have successfully updated your Garment!"
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
      flash[:notice] = "You have successfully destroyed your Garment from the Collection"
      redirect_to admin_clothings_path
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
        params.require(:clothing).permit(:name, :description, :fabric, :url, :category, :available, :pattern_name, :origin_date, :pattern_cost, :cost,  :image, photos: [])
      else
        hash = {}
        hash[:name] = params[:name]
        hash[:description] = params[:description]
        hash[:category] = params[:category]
        hash[:available] = params[:available]
        hash[:origin_date] = params[:origin_date]
        hash[:cost] = params[:cost]
        hash[:image] = params[:image]
        hash[:photos] = params[:photos]
        return hash
      end
    end
end
