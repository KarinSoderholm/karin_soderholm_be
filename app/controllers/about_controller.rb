class AboutController < ApplicationController
  def bio
    @socials = Social.all
  end

  def contact
    @socials = Social.all
  end

  def index
      @socials = Social.all
  end

  def show
    @socials = Social.all 
  end
end
