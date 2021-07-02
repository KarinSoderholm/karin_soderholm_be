class Admin::OrdersController < Admin::BaseController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :edit]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :new]


  def show
  end

  def index
    @orders = Order.all
  end

  def new
  end

  def create
    order = Order.new(order_params)
    if order.save
      flash[:success] = "Hooray you created a new order"
      redirect_to admin_user_order_path(order)
    else
      flash.now[:error] = "The order can not be created at this time. Please try again"
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update(order_params)
      flash[:success] = "Hooray, you updated the order"
      redirect_to admin_user_order_path(order)
    else
      flash.now[:error] = "The order can not be updated at this time. Please try again"
      render :edit
    end
  end

  def destroy
    if @order.delete(order_params)
      flash[:success] = "Hooray, you deleted the order"
      redirect_to admin_user_orders_path
    else
      flash.now[:error] = "The order can not be deleted at this time. Please try again"
      render :show
    end
  end

  def ship
  end

  def fulfilled
  end 

  private
  def set_user
    @user = current_user
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    if params[:order]
      params.require(:order).permit(:status, :user_id)
    else
      hash = {}
      hash[:status] = params[:status]
      hash[:user_id] = params[:user_id]
      return hash
    end
  end
end
