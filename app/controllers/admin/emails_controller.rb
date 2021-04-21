class Admin::EmailsController < Admin::BaseController
  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
  end

  def create
    @email = Email.new(email_params)
    if @email.save
      flash[:notice] = "Welcome to Karin's Community. We will be in touch soon!"
    else
      generate_flash(@email)
      render :new
    end
  end

  private
  def email_params
    params.require(:email).permit(:email)
  end
end
