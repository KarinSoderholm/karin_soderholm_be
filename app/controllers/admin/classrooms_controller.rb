class Admin::ClassroomsController < Admin::BaseController
  before_action :set_classroom, only: [:show, :edit, :update, :destroy]
  require 'csv'
  def import
    classroom_data = Classroom.import(params[:file])

    if classroom_params.keys == classroom_data.keys
      @classroom = Classroom.create!(classroom_data)
      redirect_to admin_classrooms_path, notice: "Classroom Data Imported Successfully!"
    else
      improved = classroom_data.map do |k, v|
        if !classroom_params.keys.include?(k)
          classroom_data.delete(k)
        end
      end
      @classroom = Classroom.new

      if @classroom.save
        redirect_to admin_classrooms_path, notice: "Classroom Data Imported Successfully!"
      else
        redirect_to admin_classrooms_path, alert: "Classroom Data Could not be imported. Please try again"
      end
    end

  end

  def index
    @classrooms = Classroom.all
  end

  def show
  end

  def new
    @tools = Tool.all
    @requirements = Requirement.all
    @classrooms = Classroom.all
  end

  def create
    binding.pry
    classroom = Classroom.new(classroom_params)
    if classroom.save
      if !params[:requirements].nil?
        find_requirement = Classroom.find(params[:requirements])
        requirement = Requirement.create({name: find_requirement.name, classroom_id: classroom.id })
      end
      flash[:success] = 'Congrats! A new Workshop was created!'
      redirect_to admin_classrooms_path
    else
      flash[:message] = 'All fields must be filled out. There is a missing field. Try again'
      render :new
    end
  end

  def edit
    @classrooms = Classroom.all
  end

  def update
    binding.pry
    if Requirement.find_by(classroom_id: Classroom.find(params[:classroom][:requirements])).nil?
      requirement = Requirement.new(name: Classroom.find(params[:classroom][:requirements]).name, classroom_id: @classroom.id )
    end
    if @classroom.update(classroom_params)
      requirement.save
      flash[:success] = 'Congrats! The Workshop was updated!'
      redirect_to admin_classrooms_path
    else
      flash[:message] = 'All fields must be filled out. There is a missing field. Try again'
      render :edit
    end
  end

  def alert
    @classroom = Classroom.find(params[:classroom_id])
  end

  def destroy
    if @classroom.destroy
      flash[:success] = 'The Workshop was removed!'
      redirect_to admin_classrooms_path
    end
  end

  private
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    def classroom_params
      if !params[:classroom].nil?
        # binding.pry
        # params[:classroom][:requirements] = (params.dig(:classroom, :requirements) || {}).values
        # params[:classroom][:tools_needed] = (params.dig(:classroom, :tools_needed) || {}).values
        params.require(:classroom).permit(:name, :description, :image, :date, :time, :location, :cost, :active, :photo, requirements: [], tools: [])
      else
        hash = {}
        hash[:name] = params[:name]
        hash[:description] = params[:description]
        hash[:image] = params[:image]
        hash[:date] = params[:date]
        hash[:time] = params[:time]
        hash[:location] = params[:location]
        hash[:cost] = params[:cost]
        hash[:active] = params[:active]
        return hash
      end
    end
end
