class Admin::CvsController < Admin::BaseController
  before_action :set_cv, only: [:update, :destroy]
  def import

  end
  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_cv
    @cv = Cv.find(params[:id])
  end
  def cv_params
    if params[:cv]
      params.require(:cv).permit(:name, :user_id, :cv_file)
    else
      hash = {}
      hash[:name] = params[:name]
      hash[:user_id] = params[:user_id]
      return hash
    end
  end
end
