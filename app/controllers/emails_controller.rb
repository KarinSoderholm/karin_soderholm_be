class EmailsController < ApplicationController

  def create
    # binding.pry
    email_params = {}
    email_params[:email_address] = params[:email_address]
    email_params[:name] = params[:name]
    # # @email = Email.new(email_params)
    # binding.pry
    @email = Email.new(email_params)
    # @email = Email.new(params.require(:email_address).permit(:name))

    # if @email.save == true
    if @email.save
      # respond_to do |format|
      #   format.html do
      #     flash.now[:status_msg] = form_status_msg
      #     render :email, locals: { email: params }
      #   end
      # end
      # flash[:notice] = "Welcome to Karin's Community. We will be in touch soon!"
      redirect_to '/'
    else
      # generate_flash(@email)
      # flash[:notice] = 'You have already joined our community. Thank you for being apart of this already!'
      # flash[:notice] = 'Something went wrong, please re-enter your information.'
      # respond_to do |format|
      #   format.html do
      #     flash.now[:status_msg] = form_status_msg
      #     render :email, locals: { email: params }
      #   end
      # end
      redirect_to '/'
    end
  end

  def flash

  end

  def show

  end
  private
  def email_params
    # binding.pry
    params.require(:email).permit(:email_address, :name)
  end
end
