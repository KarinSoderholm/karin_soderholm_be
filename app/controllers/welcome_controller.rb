class WelcomeController < ApplicationController
  def index
    @clothings = Clothing.all
    @artworks = Artwork.all
    @classrooms = Classroom.all
    # instagram_data = InstagramService.get_instagram_account
    # @instagram_user = InstagramUser.new(instagram_data)
    # binding.pry
    # @instagram_user = InstagramFacade.new.get_instagram_account
    # @instagram_data = self.get_instagram_account
  end

  def self.get_instagram_account
    response = conn.get('/instagram_oembed') do |req|
      req.params[url] = ENV['INSTAGRAM_URL']
      req.params[access_token] = ENV['INSTAGRAM_ACCESS_TOKEN']
    end
    parse_data(response)
  end

  def parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end
  private
  def self.conn
    Faraday.new(url: 'https://graph.facebook.com')
  end
end
