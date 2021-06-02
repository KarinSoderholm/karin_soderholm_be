class UserMailer < ApplicationMailer
  default from: 'georgesoderholm@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/login'
    email = @user.email
    # email_with_name = % ("#{ @user.name }" <#{@user.email}>)
    mail(to: email, subject: 'Welcome to QuietJoyStudio!')
  end
end
