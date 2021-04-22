class ClothingsController < ApplicationController
  def index
    @clothings = Clothing.all 
  end

  def show
    @clothing = Clothing.find(params[:id])
  end

  def flash
    {}
  end
end
