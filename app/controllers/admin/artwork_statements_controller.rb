class Admin::ArtworkStatementsController < Admin::BaseController
  before_action :set_artwork_statement, only: [:show, :update, :destroy]
  def index
    @artwork_statements = ArtworkStatement.all
  end

  def show
  end

  def create
    @artwork_statement = ArtworkStatement.new(artwork_statement_params)

    if @artwork_statement.save
    else
    end
  end

  def update
    if @artwork_statement.update(artwork_statement_params)
    else
    end
  end

  def destroy
    @artwork_statement.destroy
  end

  private
    def set_artwork_statement
      @artwork_statement = ArtworkStatement.find(params[:id])
    end

    def artwork_statement_params
      params.require(:artwork_statement).permit(:name, :statement, :artwork_id)
    end
end
