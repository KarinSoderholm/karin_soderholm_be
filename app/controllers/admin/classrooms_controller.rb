# class ClassroomsController < ApplicationController
class Admin::ClassroomsController < Admin::BaseController
  before_action :set_classroom, only: [:show, :update, :destroy]
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
      # binding.pry
      @classroom = Classroom.new
      binding.pry
      if @classroom.save
        redirect_to admin_classrooms_path, notice: "Classroom Data Imported Successfully!"
      else
        binding.pry
        redirect_to admin_classrooms_path, alert: "Classroom Data Could not be imported. Please try again"
      end
    end

  end

  # GET /classrooms
  def index
    @classrooms = Classroom.all
    # render json: @classrooms
  end

  # GET /classrooms/1
  def show
  end

  def new

  end
  # POST /classrooms
  def create
    classroom = Classroom.new(classroom_params)
    if classroom.save
      flash[:success] = 'Congrats! A new Workshop was created!'
      redirect_to admin_classrooms_path
      # render json: @classroom, status: :created, location: @classroom
    else
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
    if @classroom.update(classroom_params)
      flash[:success] = 'Congrats! The Workshop was updated!'
      redirect_to admin_classrooms_path
      # render json: @classroom
    else
      flash[:message] = 'All fields must be filled out. There is a missing field. Try again'
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
        return hash
      end
    end
end
