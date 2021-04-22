# class ArtistStatementsController < ApplicationController
class Admin::ArtistStatementsController < Admin::BaseController
  before_action :set_artist_statement, only: [:show, :update, :destroy]

  # GET /artist_statements
  def index
    @artist_statements = ArtistStatement.all

    render json: @artist_statements
  end

  # GET /artist_statements/1
  def show
    render json: @artist_statement
  end

  # POST /artist_statements
  def create
    @artist_statement = ArtistStatement.new(artist_statement_params)

    if @artist_statement.save
      render json: @artist_statement, status: :created, location: @artist_statement
    else
      render json: @artist_statement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /artist_statements/1
  def update
    if @artist_statement.update(artist_statement_params)
      render json: @artist_statement
    else
      render json: @artist_statement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /artist_statements/1
  def destroy
    @artist_statement.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist_statement
      @artist_statement = ArtistStatement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def artist_statement_params
      params.require(:artist_statement).permit(:name, :statement, :artwork_id)
    end
end
