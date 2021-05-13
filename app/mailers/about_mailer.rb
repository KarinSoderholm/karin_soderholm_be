class AboutMailer < ApplicationMailer
  def contact_email
    @contact = params[:contact]

    # mail(to: "georgesoderholm@gmail.com", subject: "Customer personal communication!")
    mail(to: ADMIN_EMAIL, subject: "Customer personal communication!")
  end
end
