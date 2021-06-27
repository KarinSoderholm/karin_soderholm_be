class Admin::FabricsController < Admin::BaseController
  before_action :set_fabric, only: [:show, :update, :destroy]

  def index
    @fabrics = Fabric.all

    render json: @fabrics
  end

  def show
    render json: @fabric
  end

  def create
    @fabric = Fabric.new(fabric_params)

    if @fabric.save
      render json: @fabric, status: :created, location: @fabric
    else
      render json: @fabric.errors, status: :unprocessable_entity
    end
  end

  def update
    if @fabric.update(fabric_params)
      render json: @fabric
    else
      render json: @fabric.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @fabric.destroy
  end

  private
    def set_fabric
      @fabric = Fabric.find(params[:id])
    end

    def fabric_params
      params.require(:fabric).permit(:name, :category, :clothing_id)
    end
end
