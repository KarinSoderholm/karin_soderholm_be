class ArtshowsController < ApplicationController
  before_action :set_artshow, only: [:show, :update, :destroy]

  def index
    @artshows = Artshow.all
  end

  def show
  end

  def create
    @artshow = Artshow.new(artshow_params)

    if @artshow.save
      render json: @artshow, status: :created, location: @artshow
    else
      render json: @artshow.errors, status: :unprocessable_entity
    end
  end

  def update
    if @artshow.update(artshow_params)
    else
    end
  end

  def destroy
    if @artshow.destroy

    else

    end
  end

  private
    def set_artshow
      @artshow = Artshow.find(params[:id])
    end

    def artshow_params
      params.require(:artshow).permit(:name, :location, :start_date, :end_date, :entry_fee)
    end
end
