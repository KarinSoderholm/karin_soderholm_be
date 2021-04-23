class Admin::EmailsController < Admin::BaseController
  def import
    Email.import(params[:file])
    redirect_to root_url, notice: "Email Data Imported Successfully!"
  end

  def index
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
  end

  def new
  end

  def create
    @email = Email.new(email_params)
    if @email.save
      flash[:success] = "You successfully added a new email to your database!"
      redirect_to admin_emails_path
    else
      generate_flash(@email)
      render :new
    end
  end

  def edit
    @email = Email.find(params[:id])
  end

  def update
    @email = Email.find(params[:id])
    if @email.update(email_params)
      flash[:success] = 'Email has been updated!'
      redirect_to admin_emails_path
    else
      flash[:alert] = 'Unable to process this change. Please try again!'
      render :edit
    end

  end

  def alert
    @email = Email.find(params[:email_id])
  end

  def destroy
    email = Email.find(params[:id])
      # flash[:alert] = 'You are about to delete a contact. Are you sure you want to do that?'
      # render :alert
    if email.destroy
      flash[:success] = 'You have successfully deleted this email address!'
      redirect_to admin_emails_path
    end
  end

  private

  def email_params
    hash = {}
    hash[:name] = params[:name]
    hash[:email_address] = params[:email_address]
    return hash
    # params.require(:email).permit(:email_address, :name)
  end
end
