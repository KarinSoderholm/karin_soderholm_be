class ArtworkStatementsController < ApplicationController
  before_action :set_artwork_statement, only: [:show]

  def index
    @artwork_statements = ArtworkStatement.all
  end

  def show
  end

  private
    def set_artwork_statement
      @artwork_statement = ArtworkStatement.find(params[:id])
    end

    def artwork_statement_params
      params.require(:artwork_statement).permit(:name, :statement, :artwork_id)
    end
end
