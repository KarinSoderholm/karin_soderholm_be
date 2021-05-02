class AboutMailer < ApplicationMailer
  def contact_email
    @contact = params[:contact]

    mail(to: <ADMIN_EMAIL>, subject: "Customer personal communication!")
  end
end
