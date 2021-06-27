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
    @classrooms = Classroom.all
    classroom = Classroom.new(classroom_params)
    if classroom.save
      # if params[:requirements]
      #   requirement = Requirement.create({name: params[:requirements], classroom_id: classroom.id })
      # end
      # if params[:tools_needed]
      #   tool = Tool.create({name: params[:tools_needed], classroom_id: classroom.id })
      # end
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
    # if Requirement.find_by(classroom_id: Classroom.find(params[:classroom][:requirements])).nil?
    #   requirement = Requirement.new(name: Classroom.find(params[:classroom][:requirements]).name, classroom_id: @classroom.id )
    # end
    @classroom.set_availability(params)
    @classroom.acceptable_photos
    @classroom.set_images(params)

    if @classroom.update(classroom_params)
      # requirement.save
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

  def add_photos
    @classroom = Classroom.find(params[:classroom_id])
  end

  def photo_update
    @classroom = Classroom.find(classroom_photos_params[:classroom_id])
    if classroom_photos_params[:photo]
      @classroom.photos.attach(classroom_photos_params[:photo])
      flash[:success] = "A photo was successfully added to #{@classroom.name}"
      redirect_to admin_classroom_path(@classroom)
    else
      flash.now[:error] = 'Please try again. Unable to process that request'
      render :add_photos
    end
  end

  def remove_photo
    classroom = Classroom.find(params[:classroom_id])
    if classroom
      classroom.photos.find(params[:photo_id]).purge
      flash[:success] = "A photo was successfully deleted from #{classroom.name}"
      redirect_to admin_classroom_path(classroom)
    else
      flash.now[:error] = 'Please try again. Unable to process that request'
      render :show
    end
  end
  private
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    def classroom_photos_params
      hash = {}
      hash[:classroom_id] = params[:classroom_id].to_i
      hash[:photo] = params[:classroom][:photos]
      return hash
    end

    def classroom_params
      if !params[:classroom].nil?
        params.require(:classroom).permit(:name, :description, :image, :date, :time, :location, :cost, :active, photos: [])
      else
        hash = {}
        hash[:name] = params[:name]
        hash[:description] = params[:description]
        # hash[:image] = params[:image]
        hash[:photos] = params[:photos]
        hash[:date] = params[:date]
        hash[:time] = params[:time]
        hash[:location] = params[:location]
        hash[:cost] = params[:cost]
        hash[:active] = params[:active]
        return hash
      end
    end
end
