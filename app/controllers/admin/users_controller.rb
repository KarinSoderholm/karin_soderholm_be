class Admin::UsersController < Admin::BaseController
  before_action :require_admin
  before_action :set_user, only: [:show, :update, :destroy, :edit, :edit_password, :index]
  def show
  end

  def index
    @users = User.all
  end

  def new
  end

  def create

  end

  def profile_edit
    @user = User.find(params[:user_id])
    @user_roles = User.all.map{ |u| [ u.role ] }.uniq
  end

  def edit

  end

  def edit_password

  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Profile has been updated!'
      binding.pry
      redirect_to "/admin/users/#{current_user.id}"
    else
      @user.errors.messages.each do |key, value|
        error = value[0]
        flash.now[:error] = "The #{key} #{error}! Please try again"
      end
      render :edit
    end
  end

  def destroy
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :address, :city, :state, :zip, :email, :password)
  end
end
