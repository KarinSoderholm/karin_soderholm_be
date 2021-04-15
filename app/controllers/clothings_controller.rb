class ClothingsController < ApplicationController
  before_action :set_clothing, only: [:show, :update, :destroy]

  # GET /clothings
  def index
    @clothings = Clothing.all

    render json: @clothings
  end

  # GET /clothings/1
  def show
    render json: @clothing
  end

  # POST /clothings
  def create
    @clothing = Clothing.new(clothing_params)

    if @clothing.save
      render json: @clothing, status: :created, location: @clothing
    else
      render json: @clothing.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clothings/1
  def update
    if @clothing.update(clothing_params)
      render json: @clothing
    else
      render json: @clothing.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clothings/1
  def destroy
    @clothing.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clothing
      @clothing = Clothing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def clothing_params
      params.require(:clothing).permit(:name, :description, :image, :fabric, :url, :category, :available, :pattern_name, :origin_date, :pattern_cost, :cost)
    end
end
