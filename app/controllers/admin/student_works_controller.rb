class Admin::StudentWorksController < Admin::BaseController
  before_action :set_student_work, only: [:show, :update, :destroy, :edit]

  def show
  end

  def index
    @student_works = StudentWork.all
  end

  def edit
  end

  def update
  end

  def new
    @student_works = StudentWork.all
  end

  def destroy
  end

  def add_image
  end

  def update_image
  end

  def remove_image
  end

  private

  def set_student_work
    @student_work = StudentWork.find(params[:id])
  end

  def student_work_params
    if !params[:student_work].nil?
      params.require(:student_work).permit(:title, :description, :age_category, :image)
    else
      hash = {}
      hash[:name] = params[:name]
      hash[:description] = params[:description]
      # hash[:image] = params[:image]
      hash[:age_category] = params[:age_category]
      return hash
    end
  end
end
