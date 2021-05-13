class InstagramFacade
  def get_instagram_account
    instagram_data = InstagramService.get_instagram_account
    instagram_user = InstagramUser.new(instagram_data)
  end
end
