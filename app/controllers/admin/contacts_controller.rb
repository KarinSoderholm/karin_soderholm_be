class Admin::ContactsController < Admin::BaseController
  def messages
    @contacts = Contact.all
    # binding.pry
  end
end
