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
    map_collection = Collection.find_by(name: '100 Day Project: maps')
    commission = CommissionBloomingMap.new(commision_params)
    if commission.save
      flash[:success] = 'Thank you for interest in a custom piece of art. Karin will reach out to you shortly!!'
      redirect_to "/collections/#{ map_collection.id }"
    else
      flash[:error] = 'Please make sure that all the mandatory fields are filled out, so we can start this magical process!'
      render :new
    end
  end

  private
  def commision_params
      params.permit(:customer_name,
                    :customer_email,
                    :customer_phone,
                    :message,
                    :map_city,
                    :map_state,
                    :map_country,
                    :map_color)
  end
end
