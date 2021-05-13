class UsersController < ApplicationController
  before_action :require_user, only: :show
  before_action :exclude_admin, only: :show

  def show
    @user = current_user
    @cart = session[:cart]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
      redirect_to profile_path
    else
      generate_flash(@user)
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def edit_password
    @user = current_user
  end

  def update
    if params[:user][:email] !=  current_user.email
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "#{@user.name}'s profile has been updated!"
        redirect_to admin_users_path
      else
        @user.errors.messages.each do |key, value|
          error = value[0]
          flash.now[:error] = "The #{key} #{error}! Please try again"
        end
        render :edit
      end
    else
      @user = current_user
      if @user.update(user_params)
        flash[:notice] = 'Your profile has been updated!'
        if current_user.admin?
          redirect_to admin_user_path
        else
          redirect_to profile_path
        end
      else
        @user.errors.messages.each do |key, value|
          error = value[0]
          flash.now[:error] = "The #{key} #{error}! Please try again"
        end
        render :edit
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :city, :state, :zip, :email, :password, :role, :avatar)
  end
end
