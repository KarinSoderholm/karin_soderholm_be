class Admin::CommissionBloomingMapsController < Admin::BaseController
  before_action :set_commission_blooming_map, only: [:show, :edit, :update, :destroy]
  def show
  end

  def index
    @commissions = CommissionBloomingMap.all
  end

  def edit

  end

  def update
    if @commission_blooming_map.update(commission_blooming_map_params)
      flash[:success] = "Hooray! You have successfully updated your Commission!"
      redirect_to admin_commission_blooming_map_path(@commission_blooming_map)
    else
      flash.now[:alert] = "Please check to make sure the fields are all filled in properly. Try again"
      render :edit
    end
  end

  def new
  end

  def create
    @commission_blooming_map = CommissionBloomingMap.new(commission_blooming_map_params)

    if !@commission_blooming_map.nil?
      @commission_blooming_map.save
      flash[:success] = "You created a new commission_blooming_map"
      redirect_to admin_commission_blooming_map_path(@commission_blooming_map)
    else
      flash[:error] = "Unable to process that request. Please try again"
      render :new
    end
  end

  def alert
    @commission_blooming_map = CommissionBloomingMap.find(params[:commission_blooming_map_id])
  end

  def destroy
    @commission_blooming_map.destroy
  end

  private

  def set_commission_blooming_map
    @commission_blooming_map = CommissionBloomingMap.find(params[:id])
  end

  def commission_blooming_map_params
    if !params[:commission_blooming_map].nil?
      params.require(:commission_blooming_map).permit(:customer_name, :customer_email, :customer_phone, :message, :map_city, :map_state, :map_flower, :map_color, :commission_status, :notes, :commission_payment, :price)
    else
      hash = {}
      hash[:customer_name] = params[:customer_name]
      hash[:customer_email] = params[:customer_email]
      hash[:customer_phone] = params[:customer_phone]
      hash[:message] = params[:message]
      hash[:map_city] = params[:map_city]
      hash[:map_state] = params[:map_state]
      hash[:map_flower] = params[:map_flower]
      hash[:map_color] = params[:map_color]
      hash[:commission_status] = 'not_started'
      return hash
    end
  end
end
