class EmailsController < ApplicationController
  def new
  end

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
      flash[:notice] = "Welcome to Karin's Community. We will be in touch soon!"
      redirect_to welcome_index_path
    else
      # generate_flash(@email)
      flash.now[:notice] = 'You have already joined our community. Thank you for being apart of this already!'
      # flash.now[:notice] = "Email #{generate_flash(@email)}! That means you are already apart of this community! Thank you!"
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

  def show

  end

  def edit
    @email = Email.find(params[:id])
  end

  def update
    @email = Email.find(params[:id])
    if @email.update(email_params)
      flash[:notice] = 'Email has been updated!'
      redirect_to admin_emails_path
    else
      flash[:alert] = 'There was a problem updating the email. Please make sure both fields are filled out!'
      render :edit
    end
  end
  private
  def email_params
    # binding.pry
    params.require(:email).permit(:email_address, :name)
  end
end
