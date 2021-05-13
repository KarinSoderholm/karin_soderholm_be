class SocialsController < ApplicationController
  def index
    @socials = Social.all
  end

  def show

  end


end
