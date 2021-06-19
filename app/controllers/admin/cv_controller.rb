class Admin::CvController < Admin::BaseController
  before_action :set_cv, only: [:show, :edit, :update, :destroy]
  def import

  end
  def new
  end

  def show

  end

  def create
    @cv = Cv.new(cv_params)
    if @cv.save
      flash[:success] = "You successfully added a new cv to your database!"
      redirect_to admin_cv_path(@cv)
    else
      @cv.errors.messages.each do |key, value|
        error = value[0]
        flash.now[:error] = "The #{key} #{error}! Please try again"
      end
      render :new
    end
  end
  def edit
  end

  def update
    @cv.set_file(params)
    if @cv.update(cv_params)
      flash[:success] = 'Congrats! The CV was updated!'
      redirect_to admin_cv_path(@cv)
    else
      flash[:message] = 'All fields must be filled out. There is a missing field. Try again'
      render :edit
    end
  end

  def destroy
    @cv.delete_file(params)
    if @cv.destroy
      flash[:notice] = "You have successfully destroyed your CV"
      redirect_to admin_user_path(current_user)
    else
      flash.now[:notice] = "Unable to destroy this CV. Try again"
      render :show
    end
  end

  def remove_file
    cv = Cv.find(params[:cv_id])
    if cv
      cv.delete_file(params)
      flash[:success] = "A CV was successfully deleted from #{cv.name}"
      redirect_to admin_cv_path(cv)
    else
      flash.now[:error] = 'Please try again. Unable to process that request'
      render :show
    end
  end

  private

  def set_cv
    @cv = Cv.find(params[:id])
  end

  def cv_params
    if params[:cv]
      params.require(:cv).permit(:name, :user_id, :cv_file)
    else
      hash = {}
      hash[:name] = params[:name]
      hash[:user_id] = params[:user_id]
      return hash
    end
  end
end
