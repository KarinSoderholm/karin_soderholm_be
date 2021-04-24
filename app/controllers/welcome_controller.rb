class WelcomeController < ApplicationController
  def index
    @clothings = Clothing.all
    @artworks = Artwork.all
    @classrooms = Classroom.all 
  end

  def flash
    {}
  end
end
