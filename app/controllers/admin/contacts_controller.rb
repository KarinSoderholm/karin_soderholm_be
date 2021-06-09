class Admin::ContactsController < Admin::BaseController
  def messages
    @contacts = Contact.all
  end
  def update
    @contact = Contact.find(params[:id])
    if !params[:contact].nil?
      @contact.update(contact_params)
      flash.now[:success] = "Message status was changed to #{@contact.message_status}!"
      redirect_to admin_contact_messages_path(@contact)
    else
      flash[:error] = 'Unable to update. Please try again'
      redirect_to admin_contact_messages_path(@contact)
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :subject, :customer_email_address, :message, :message_status)
  end
end
