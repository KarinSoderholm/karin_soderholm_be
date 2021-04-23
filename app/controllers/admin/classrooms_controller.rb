# class ClassroomsController < ApplicationController
class Admin::ClassroomsController < Admin::BaseController
  before_action :set_classroom, only: [:show, :update, :destroy]
  require 'csv'
  def import
    # binding.pry
    Classroom.import(params[:file])
    redirect_to root_url, notice: "Classroom Data Imported Successfully!"
  end

  # GET /classrooms
  def index
    @classrooms = Classroom.all
# binding.pry
    # render json: @classrooms
  end

  # GET /classrooms/1
  def show
    # render json: @classroom
  end

  # POST /classrooms
  def create
    # if !classroom_params[:photo].empty?
    #   classroom_params[:image] = classroom_params[:photo]
    # end
    binding.pry
    classroom = Classroom.new(classroom_params)
    # classroom.photo.attach(params[:photo])
    # binding.pry
    # @classroom.photo.attach(io: File.open('app/assets/images'), filename: '', content_type: 'image/png')
    if classroom.save
      binding.pry
      flash[:success] = 'Congrats! A new Workshop was created!'
      redirect_to admin_classrooms_path
      # render json: @classroom, status: :created, location: @classroom
    else
      binding.pry
      flash[:message] = 'All fields must be filled out. There is a missing field. Try again'
      render :new
      # render json: @classroom.errors, status: :unprocessable_entity
    end
  end

  def edit
    @classroom = Classroom.find(params[:id])
  end
  # PATCH/PUT /classrooms/1
  def update
    # binding.pry
    if @classroom.update(classroom_params)
      flash[:success] = 'Congrats! A new Workshop was created!'
      # binding.pry
      redirect_to admin_classrooms_path
      # render json: @classroom
    else
      flash[:message] = 'All fields must be filled out. There is a missing field. Try again'
      # binding.pry
      render :edit
      # render json: @classroom.errors, status: :unprocessable_entity
    end
  end

  def alert
    @classroom = Classroom.find(params[:classroom_id])
  end
  # DELETE /classrooms/1
  def destroy
    @classroom = Classroom.find(params[:id])
    if @classroom.destroy
      flash[:success] = 'The Workshop was removed!'
      redirect_to admin_classrooms_path
    end
  end

  # def flash
  #   {}
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def classroom_params
      if !params[:classroom].nil?
        params.require(:classroom).permit(:name, :description, :image, :date, :time, :location, :requirements, :tools_needed, :cost, :active, :photo)
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
        # hash[:photo] = params[:photo]
        return hash
      end
    end
end
