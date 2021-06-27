class Admin::Workshop::ToolsController < Admin::BaseController
  before_action :set_tool, only: [:show, :update, :edit, :destroy]
  before_action :set_classroom, only: [:new, :create, :update, :index]
  def index
    @tools = @classroom.tools
  end

  def show
    @classroom = Classroom.find(@tool.classroom_id)
  end

  def new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      flash[:success] = "A new tool was added to #{@classroom.name}"
      redirect_to admin_classroom_path(@classroom)
    else
      flash.now[:error] = 'A tool name is needed. Please try again'
      render :new
    end
  end

  def edit
    # @tool = Tool.find(params[:id])
  end
  def update
    something = {}
    something[:name] = params["/admin/workshop/tools/#{@tool.id}/edit/#{@tool.classroom.id}"][:name]
    if @tool.update(something)
      flash[:success] = "You updated the tool!"
      redirect_to admin_classroom_path(@classroom)
    else
      flash.now[:error] = 'Something went wrong when updating. Please try again'
      render :edit
    end
  end

  def destroy
    classroom = @tool.classroom
    if @tool.destroy
      flash[:success] = "The tool was deleted from #{classroom.name}"
      redirect_to admin_classroom_path(classroom)
    else
      flash[:error] = 'Something went wrong. Please try again'
      render :show
    end
  end

  private
    def set_tool
      @tool = Tool.find(params[:id])
    end
    def set_classroom
      @classroom = Classroom.find(params[:classroom_id])
    end

    def tool_params
      params.permit(:name, :classroom_id)
    end
end
