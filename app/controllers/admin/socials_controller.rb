class Admin::SocialsController < Admin::BaseController
  before_action :set_social, only: [:show, :update, :destroy, :edit]

  def index
    @socials = Social.all
  end

  def show
  end

  # def new
  # end
  #
  # def create
  #   @social = Social.new(social_params)
  #   if @social.save
  #     flash[:success] = "You have added to your Social links"
  #     redirect_to "/admin/socials/#{@social.id}"
  #   else
  #     flash[:error] = "Unable to save the details. Please try again!"
  #     render :new
  #   end
  # end

  def edit
  end

  def update
    if @social.update(social_params)
      flash[:success] = "You have updated your Socials! Wahoo! More connections"
      redirect_to "/admin/socials/#{current_user.id}"
    else
      flash[:error] = "There was a problem with your request. Please try again"
      render :edit
    end
  end

  def destroy
    @social.destroy
  end

  private
    def set_social
      @social = Social.find_by(user_id: current_user.id)
    end

    def social_params
      params.require(:social).permit(:linked_in, :facebook, :instagram, :pinterest, :twitter, :email, :etsy)
    end
end
