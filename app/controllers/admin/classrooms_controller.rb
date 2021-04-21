# class ClassroomsController < ApplicationController
class Admin::ClassroomsController < Admin::BaseController
  before_action :set_classroom, only: [:show, :update, :destroy]

  def import
    binding.pry
    Classroom.import(params[:file])
    redirect_to root_url, notice: "Classroom Data Imported Successfully!"
  end

  # GET /classrooms
  def index
    @classrooms = Classroom.all
# binding.pry
    render json: @classrooms
  end

  # GET /classrooms/1
  def show
    render json: @classroom
  end

  # POST /classrooms
  def create
    @classroom = Classroom.new(classroom_params)

    if @classroom.save
      render json: @classroom, status: :created, location: @classroom
    else
      render json: @classroom.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /classrooms/1
  def update
    if @classroom.update(classroom_params)
      render json: @classroom
    else
      render json: @classroom.errors, status: :unprocessable_entity
    end
  end

  # DELETE /classrooms/1
  def destroy
    @classroom.destroy
  end

  def flash
    {}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def classroom_params
      params.require(:classroom).permit(:name, :description, :image, :date, :time, :location, :requirements, :tools_needed, :cost, :active)
    end
end
