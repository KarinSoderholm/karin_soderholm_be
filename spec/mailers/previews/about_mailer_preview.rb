# Preview all emails at http://localhost:3000/rails/mailers/about_mailer
class AboutMailerPreview < ActionMailer::Preview
  def contact_email
    # Set up a temporary order for the preview
    contact = Contact.new(name: "Joe Smith", customer_email_address: "joe@gmail.com", subject: "help!", message: "I want to place an order!")

    AboutMailer.with(contact: contact).contact_email
  end
end
