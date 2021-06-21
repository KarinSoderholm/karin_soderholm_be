class StudentWorksController < ApplicationController
  before_action :set_student_work, only: [:show, :update, :destroy]
  def index
    @student_works = StudentWork.all
  end
  def show

  end

  private
  def set_student_work
    @student_work = StudentWork.find(params[:id])
  end

  def student_work_params
    params.require(:student_work).permit(:title, :description, :age_category, :image)
  end
end
