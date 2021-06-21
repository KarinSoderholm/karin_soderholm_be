class WelcomeController < ApplicationController
  def index
    @clothings = Clothing.all
    @artworks = Artwork.all
    @classrooms = Classroom.all
    # check Postico for Karin's user_id
    @social = Social.find_by(user_id: 2)
    # instagram_data = InstagramService.get_instagram_account
    # @instagram_user = InstagramUser.new(instagram_data)
    # @instagram_user = InstagramFacade.new.get_instagram_account
    # binding.pry

    # @instagram_user = InstagramUser.new(self.get_instagram_account)
    # @instagram_user = web_post #this should be an array although it isn't named with that inference
    # @instagram_user = profile_home_page #this should be an array although it isn't named with that inference
    # binding.pry
  end

  def profile_home_page
    binding.pry
    get_instagram_account(ENV['KARIN_INSTAGRAM_HOME_URL'])
  end
  def web_post
    instagram_posts = []
    instagram_posts << ENV['INSTAGRAM_URL1']
    instagram_posts << ENV['INSTAGRAM_URL2']
    instagram_posts << ENV['INSTAGRAM_URL3']
    instagram_posts << ENV['INSTAGRAM_URL4']
    instagram_posts << ENV['INSTAGRAM_URL5']
    instagram_posts << ENV['INSTAGRAM_URL6']
    binding.pry
    instagram_posts.each do |url|
      InstagramUser.new(get_instagram_account(url))
    end
    # ENV[INSTAGRAM_URLS].each do |url|
    #   InstagramUser.new(get_instagram_account(url))
    # end
  end
  def get_instagram_account(url)
    # response = conn.get("/instagram_oembed?url=https://www.instagram.com/so__karin/?utm_source=ig_embed&ig_rid=74b564b9-5495-408c-9b43-16f6bda9f53b&access_token=#{ENV['INSTAGRAM_ACCESS_TOKEN']}")
    # response = conn.get("/instagram_oembed?url=https://www.instagram.com/p/CPKRVMTlwyj/?utm_source=ig_embed&ig_rid=278415b4-e42b-46D50-9630-b2959a1c458a&access_token=#{ENV['INSTAGRAM_ACCESS_TOKEN']}")
    response = conn.get("/instagram_oembed?url=#{url}/?utm_source=ig_embed&ig_rid=278415b4-e42b-46D50-9630-b2959a1c458a&access_token=#{ENV['INSTAGRAM_ACCESS_TOKEN']}")
    # response = conn.get("/instagram_oembed?url=#{ENV['INSTAGRAM_URL']}?utm_source=ig_embed&ig_rid=278415b4-e42b-46D50-9630-b2959a1c458a&access_token=#{ENV['INSTAGRAM_ACCESS_TOKEN']}")
    # response = conn.get("/instagram_oembed?url=https://www.instagram.com/p/CPHwdfxls-c/?utm_source=ig_embed&ig_rid=278415b4-e42b-46D50-9630-b2959a1c458a&access_token=#{ENV['INSTAGRAM_ACCESS_TOKEN']}")
    # response = conn.get("/instagram_oembed?url=#{ENV['INSTAGRAM_URL']}&access_token=#{ENV['INSTAGRAM_ACCESS_TOKEN']}")
    # response = conn.get("/instagram_oembed?url=#{ENV['INSTAGRAM_URL']}&access_token=#{ENV['INSTAGRAM_ACCESS_TOKEN']}")
    # response = conn.get("/556794212?fields=id,name&access_token=#{ENV['INSTAGRAM_ACCESS_TOKEN']}")
    # another_response = conn2.get("/556794212/feed&access_token=#{ENV['INSTAGRAM_ACCESS_TOKEN']}")
    # response = conn.get('/instagram_oembed') do |req|
    #   req.params[url] = ENV['INSTAGRAM_URL']
    #   req.params[access_token] = ENV['INSTAGRAM_ACCESS_TOKEN']
    # end
    parse_data(response)
  end

  def parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end


  private
  def conn2
    Faraday.new(url: 'https://graph.facebook.com')
  end
  def conn
    Faraday.new(url: 'https://graph.facebook.com/v10.0')
  end
end
