class SessionsController < ApplicationController
  def new
    if current_user
      flash[:notice] = 'You are already logged in!'
      login_redirect(current_user)
    end
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      login_redirect(user)
    else
      flash[:notice] = 'Your email or password was incorrect!'
      render :new
    end
  end

  def logout
    session.delete(:user_id)
    session.delete(:cart)
    flash[:notice] = 'You have been logged out!'
    redirect_to welcome_index_path
  end

  def flash
    {}
  end

  private

  def login_redirect(user)
    session[:user_id] = user.id
    if current_admin?
      redirect_to admin_dashboard_index_path
    else
      # redirect_to "/users/#{user.id}"
      # redirect_to profile_path
      redirect_to '/'
    end
  end
end