class CommissionBloomingMapsController < ApplicationController
  def index
    commissions = CommissionBloomingMap.all
  end

  def show
    commission = CommissionBloomingMap.find(params[:id])
  end

  def new
  end

  def create
    map_collection = Collection.find_by(name: '100 Day Project: Maps')
    commission = CommissionBloomingMap.new(commission_params)
    if commission.save
      flash[:success] = 'Thank you for interest in a custom piece of art. Karin will reach out to you shortly!!'
      redirect_to "/artwork/collections/#{ map_collection.id }"
    else
      flash[:error] = 'Please make sure that all the mandatory fields are filled out, so we can start this magical process!'
      render :new
    end
  end

  private
  def commission_params
      params.permit(:customer_name,
                    :customer_email,
                    :customer_phone,
                    :message,
                    :map_city,
                    :map_state,
                    :map_country,
                    :map_color,
                    :map_flower,
                    :commission_status)
  end
end
