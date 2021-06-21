class EmailsController < ApplicationController
  def new

  end

  def create
    email_params = {}
    email_params[:email_address] = params[:email_address]
    email_params[:name] = params[:name]
    @email = Email.new(email_params)
    if @email.save
      flash[:notice] = "Welcome to Karin's Community. We will be in touch soon!"
      redirect_to welcome_index_path
    else
      flash.now[:notice] = 'You have already joined our community. Thank you for being apart of this already!'
      redirect_to '/'
    end
  end

  def show

  end
  private
  def email_params
    params.require(:email).permit(:email_address, :name)
  end
end
