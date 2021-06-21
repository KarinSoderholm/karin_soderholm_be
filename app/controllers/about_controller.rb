class AboutController < ApplicationController
  def bio
    @socials = Social.all
  end

  def contact
    @socials = Social.all
  end

  def cv
    user = User.find_by(name: 'Karin Soderholm')
    @cv = user.cv
  end

  def new
  end

  def faq
    @faqs = FrequentlyAskedQuestion.order(faq_order: :asc)
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      AboutMailer.with(contact: @contact).contact_email.deliver_later
      flash[:success] = 'Your message has been sent. Karin will get back with you shortly!'
      redirect_to '/about/1/bio'
    else
      flash.now[:error] = "All fields must be filled in to send an email. Please try again!"
      render :contact
    end
  end

  def index
    @contacts = Contact.all
    @socials = Social.all
  end

  def show
    @socials = Social.all
  end

  private
  def contact_params
    hash = {}
     hash[:name]= params[:name]
     hash[:subject]= params[:subject]
     hash[:customer_email_address]= params[:customer_email_address]
     hash[:message]= params[:message]
    return hash
  end
end
