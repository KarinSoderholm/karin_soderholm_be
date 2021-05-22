class SocialsController < ApplicationController
  def index
    @socials = Social.all
  end

  def show
    @social = Social.find_by(user_id: current_user.id)
  end
end
