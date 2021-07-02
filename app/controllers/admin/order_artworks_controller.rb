class Admin::OrderArtworksController < Admin::BaseController
  before_action :set_order_artwork, only: [:show, :edit, :update, :destroy, :edit]

  def show
  end

  def index
    @order_artworks = OrderArtwork.all
  end

  def new
  end

  def create
    order_artwork = OrderArtwork.new(order_params)
    if order.save
      flash[:success] = "Hooray you created a new order"
      redirect_to admin_user_order_artwork_path(order)
    else
      flash.now[:error] = "The order can not be created at this time. Please try again"
      render :new
    end
  end

  def edit
  end

  def update
    if @order_artwork.update(order_params)
      flash[:success] = "Hooray, you updated the order"
      redirect_to admin_user_order_artwork_path(order)
    else
      flash.now[:error] = "The order can not be updated at this time. Please try again"
      render :edit
    end
  end

  def destroy
    if @order_artwork.delete(order_params)
      flash[:success] = "Hooray, you deleted the order"
      redirect_to admin_user_order_artworks_path
    else
      flash.now[:error] = "The order can not be deleted at this time. Please try again"
      render :show
    end
  end

  private
  def set_order_artwork
    @order_artwork = OrderArtwork.find(params[:id])
  end

  def order_params
    if params[:order_artwork]
      params.require(:order_artwork).permit(:artwork_id, :order_id, :price, :quantity, :fulfilled)
    else
      hash = {}
      hash[:artwork_id] = params[:artwork_id]
      hash[:order_id] = params[:order_id]
      hash[:price] = params[:price]
      hash[:quantity] = params[:quantity]
      hash[:fulfilled] = params[:fulfilled]
      return hash
    end
  end
end
