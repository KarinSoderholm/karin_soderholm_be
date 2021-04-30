class Admin::SocialsController < Admin::BaseController
  before_action :set_social, only: [:show, :update, :destroy, :edit]

  # GET /socials
  def index
    @socials = Social.all
  end

  # GET /socials/1
  def show
    binding.pry
  end

  def new
  end
  # POST /socials
  def create
    @social = Social.new(social_params)
    if @social.save
      flash[:success] = "You have added to your Social links"
      redirect_to "/admin/socials/#{current_user.id}"
      # render json: @social, status: :created, location: @social
    else
      flash[:error] = "Unable to save the details. Please try again!"
      render :new
      # render json: @social.errors, status: :unprocessable_entity
    end
  end

  def edit

  end
  # PATCH/PUT /socials/1
  def update
    if @social.update(social_params)
      flash[:success] = "You have updated your Socials! Wahoo! More connections"
      render :show
    else
      flash[:error] = "There was a problem with your request. Please try again"
      # render json: @social.errors, status: :unprocessable_entity
      render :edit
    end
  end

  # DELETE /socials/1
  def destroy
    @social.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social
      @social = Social.find_by(user_id: current_user.id)
    end

    # Only allow a trusted parameter "white list" through.
    def social_params
      if !params[:socail].nil?
        params.require(:social).permit(:linked_in, :facebook, :instagram, :pinterest, :twitter, :email, :etsy)
      else
        social_params = {}
        social_params[:pinterest] = params[:pinterest]
        social_params[:instagram] = params[:instagram]
        social_params[:email] = params[:email]
        social_params[:facebook] = params[:facebook]
        social_params[:linked_in] = params[:linked_in]
        social_params[:twitter] = params[:twitter]
        social_params[:etsy] = params[:etsy]
        social_params[:user_id] = current_user.id
         return social_params
      end
    end
end
