class Admin::DashboardController < Admin::BaseController
  def index
    @user = current_user
    @emails = Email.all
    @artworks = Artwork.all
    @classrooms = Classroom.all
    @clothings = Clothing.all
  end

  def show
    @user = current_user
  end

  def flash
    {}
  end
end
