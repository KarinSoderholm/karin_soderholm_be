class InstagramController < ActionController::API
  def index
    # instagram_data = InstagramService.get_instagram_account
    # @instagram_user = InstagramUser.new(instagram_data)
    @instagram_user = InstagramFacade.get_instagram_account
  end

  def show
    @instagram_user = InstagramFacade.get_instagram_account
  end
end
