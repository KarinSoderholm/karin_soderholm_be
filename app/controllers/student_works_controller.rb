class StudentWorksController < ApplicationController
  before_action :set_student_work, only: [:show]
  def index
    @student_works = StudentWork.all
  end

  def show
  end

  def youth
    @student_works = StudentWork.find_youths
  end

  def adult
    @student_works = StudentWork.find_adults
  end

  private
  def set_student_work
    @student_work = StudentWork.find(params[:id])
  end

  def student_work_params
    params.require(:student_work).permit(:title, :description)
  end
end
