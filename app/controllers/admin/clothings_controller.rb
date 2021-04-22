# class ClothingsController < ApplicationController
class Admin::ClothingsController < Admin::BaseController
  before_action :set_clothing, only: [:show, :update, :destroy]

  def import
    Clothing.import(params[:file])
    redirect_to root_url, notice: "Clothing Data Imported Successfully!"
  end
  # GET /clothings
  def index
    @clothings = Clothing.all

    # render json: @clothings
  end

  # GET /clothings/1
  def show
    set_clothing
    # render json: @clothing
  end

  # POST /clothings
  def create
    @clothing = Clothing.new(clothing_params)

    if @clothing.save
      flash[:success] = "Hooray! You have successfully added a Garment to the Collection!"
      redirect_to admin_clothings_path
      # render json: @clothing, status: :created, location: @clothing
    else
      flash.now[:alert] = "Please check to make sure the fields are all filled in properly. Try again"
      render :new
      # render json: @clothing.errors, status: :unprocessable_entity
    end
  end

  def edit
    @clothing = Clothing.find(params[:id])
  end
  # PATCH/PUT /clothings/1
  def update
    # binding.pry
    if @clothing.update(clothing_params)
      @clothing = Clothing.find(params[:id])
      # render json: @clothing
    else
      # render json: @clothing.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clothings/1
  def destroy
    if @clothing.destroy
      flash[:alert] = "You have successfully destroyed your Garment from the Collection"
      redirect_to admin_clothings_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clothing
      @clothing = Clothing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def clothing_params
      if !params[:clothing].nil?
        params.require(:clothing).permit(:name, :description, :image, :fabric, :url, :category, :available, :pattern_name, :origin_date, :pattern_cost, :cost)
      else
        hash = {}
        hash[:name] = params[:name]
        hash[:description] = params[:description]
        hash[:image] = params[:image]
        hash[:category] = params[:category]
        hash[:available] = params[:available]
        hash[:origin_date] = params[:origin_date]
        hash[:cost] = params[:cost]
        return hash
      end
    end
end
