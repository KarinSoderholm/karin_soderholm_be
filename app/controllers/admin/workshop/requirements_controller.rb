class Admin::Workshop::RequirementsController < Admin::BaseController
  before_action :set_requirement, only: [:show, :update, :destroy, :edit]
  before_action :set_classroom, only: [:new, :create, :edit, :update, :index]

  def index
    @requirements = @classroom.requirements
  end

  def show
    @classroom = Classroom.find(@requirement.classroom_id)
  end

  def new
    @classrooms = Classroom.all
  end

  def create
    @requirement = Requirement.new(requirement_params)

    if @requirement.save
      flash[:success] = "A new requirement was added to #{@classroom.name}"
      redirect_to admin_classroom_path(@classroom)
    else
      flash.now[:error] = 'A requirement name is needed. Please try again'
      render :new
    end
  end

  def edit
    @classrooms = Classroom.all
  end

  def update
    if @requirement.update(requirement_params)
      flash[:success] = "You updated the requirement!"
      redirect_to admin_classroom_path(@classroom)
    else
      flash.now[:error] = 'Something went wrong when updating. Please try again'
      render :edit
    end
  end

  def destroy
    classroom =  Classroom.find(Requirement.find(params[:id]).classroom_id)
    @requirement.destroy
    if @requirement.destroy
      flash[:success] = "The requirement was deleted from #{classroom.name}"
      redirect_to admin_classroom_path(classroom)
    else
      flash[:error] = 'Something went wrong. Please try again'
      render :show
    end
  end

  private
    def set_requirement
      @requirement = Requirement.find(params[:id])
    end
    def set_classroom
      @classroom = Classroom.find(params[:classroom_id])
    end

    def requirement_params
      # params[:classroom][:requirements] = (params.dig(:classroom, :requirements) || {}).values

      params.permit(:name, :classroom_id)
    end
end
