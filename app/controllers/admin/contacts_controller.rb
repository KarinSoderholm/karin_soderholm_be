class Admin::ContactsController < Admin::BaseController
  def messages
    @contacts = Contact.all
  end
  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash.now[:success] = "Message status was changed to #{@contact.message_status}!"
      redirect_to admin_contact_messages_path(@contact)
    else
      flash.now[:error] = 'Unable to update. Please try again'
      render :messages
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :subject, :customer_email_address, :message, :message_status)
  end
end
