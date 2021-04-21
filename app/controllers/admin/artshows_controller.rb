# class ArtshowsController < ApplicationController
class Admin::ArtshowsController < Admin::BaseController
  before_action :set_artshow, only: [:show, :update, :destroy]

  # GET /artshows
  def index
    @artshows = Artshow.all

    render json: @artshows
  end

  # GET /artshows/1
  def show
    render json: @artshow
  end

  # POST /artshows
  def create
    @artshow = Artshow.new(artshow_params)

    if @artshow.save
      render json: @artshow, status: :created, location: @artshow
    else
      render json: @artshow.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artshows/1
  def update
    if @artshow.update(artshow_params)
      render json: @artshow
    else
      render json: @artshow.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artshows/1
  def destroy
    @artshow.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artshow
      @artshow = Artshow.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def artshow_params
      params.require(:artshow).permit(:name, :location, :start_date, :end_date, :entry_fee)
    end
end
