class Admin::StudentWorksController < Admin::BaseController
  before_action :set_student_work, only: [:show, :update, :destroy, :edit]

  def show
  end

  def index
    @student_works = StudentWork.all
  end

  def edit
    @student_works = StudentWork.all
  end

  def update
    if @student_work.update(student_work_params)
      flash[:success] = "You updated your StudentWork! Congrats"
      redirect_to admin_student_work_path(@student_work)
    else
      flash.now[:error] = 'Cannot update the StudentWork. Please fill out manditory fields and try again'
      render :edit
    end
  end

  def new
    @student_works = StudentWork.all
  end

  def create
    student_work = StudentWork.new(student_work_params)
    if student_work.save
      student_work.set_image(params)
      flash[:success] = "You created a new StudentWork! Congrats"
      redirect_to admin_student_works_path
    else
      flash.now[:error] = 'Cannot create the StudentWork. Please fill out manditory fields and try again'
      render :new
    end
  end

  def destroy
    @student_work.remove_image(params)
    if @student_work.destroy
      flash[:success] = "The StudentWork was successfully deleted!"
      redirect_to admin_student_works_path
    else
      flash[:error] = 'Something went wront with that request. Please try again'
      render :show
    end
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
      hash[:title] = params[:title]
      hash[:description] = params[:description]
      # hash[:image] = params[:image]
      hash[:age_category] = params[:age_category]
      return hash
    end
  end
end
