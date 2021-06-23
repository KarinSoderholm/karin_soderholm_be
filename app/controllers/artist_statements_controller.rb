class ArtistStatementsController < ApplicationController
  before_action :set_artist_statement, only: [:show]

  def index
    @artist_statements = ArtistStatement.all
  end

  def show
  end

  private
    def set_artist_statement
      @artist_statement = ArtistStatement.find(params[:id])
    end

    def artist_statement_params
      params.require(:artist_statement).permit(:statement, :artist_id)
    end
end
